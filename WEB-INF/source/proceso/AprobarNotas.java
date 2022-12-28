package proceso;

import dinamica.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.sql.DataSource;

public class AprobarNotas extends GenericTransaction{

	public int service(Recordset inputParams) throws Throwable 
	{ 
		int rc = 0;	//variable a retornar.
		String sql;
		double mdc_saldo_doc_ml;
		double mdc_saldo_doc_ma;
		double mdd_monto_ml;
		double mdd_monto_ma;
		String ModControlFiscal="";
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//establecer la conexion con la base de datos.
		
			DataSource ds = Jndi.getDataSource(jndiName); 
			Connection conn = ds.getConnection();
			this.setConnection(conn);
		
		//**
		
		conn.setAutoCommit(false);
		
		String fechaActual= sdformat.format(new Date());
		
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		  
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/logAprobarNotas_"+fechaActual+".txt";
		else
			file = "./logAprobarNotas_"+fechaActual+".txt";
		
		File newLogFile = new File(file);
		FileWriter fw;
		String str="";
		
		if(!newLogFile.exists())
			fw = new FileWriter(newLogFile);
		else
			fw = new FileWriter(newLogFile,true);
		
		BufferedWriter bw=new BufferedWriter(fw);
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		try
		{
			str = "----------"+timestamp+"----------";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			bw.newLine();
			
			Db db = getDb(); //objeto de conexion.
			
			sql = getSQL(getResource("select-smn_mov_documento_cob_detalle.sql"), inputParams);
			Recordset rsMovDocCobDet = db.get(sql);
			
			str = "Procesando nota";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			rsMovDocCobDet.first();
			
			if(rsMovDocCobDet.getString("mdd_monto_ml")!=null)
				mdd_monto_ml=rsMovDocCobDet.getDouble("mdd_monto_ml");
			else
				mdd_monto_ml=0;
			
			if(rsMovDocCobDet.getString("mdd_monto_ma")!=null)
				mdd_monto_ma=rsMovDocCobDet.getDouble("mdd_monto_ma");
			else
				mdd_monto_ma=0;
			
			if(rsMovDocCobDet.getString("mdc_saldo_doc_ma")!=null)
				mdc_saldo_doc_ma=rsMovDocCobDet.getDouble("mdc_saldo_doc_ma");
			else
				mdc_saldo_doc_ma=0;
			
			if(rsMovDocCobDet.getString("mdc_saldo_doc_ml")!=null)
				mdc_saldo_doc_ml=rsMovDocCobDet.getDouble("mdc_saldo_doc_ml");
			else
				mdc_saldo_doc_ml=0;
			
			if(rsMovDocCobDet.getString("tdo_tipo_movimiento").equals("NC"))
			{
				str = "Calculando nota de credito";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				mdc_saldo_doc_ml-=mdd_monto_ml;
				mdc_saldo_doc_ma-=mdd_monto_ma;
			}
			else
			if(rsMovDocCobDet.getString("tdo_tipo_movimiento").equals("ND"))
			{
				str = "Calculando nota de debito";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				mdc_saldo_doc_ml+=mdd_monto_ml;
				mdc_saldo_doc_ma+=mdd_monto_ma;
			}
			
			inputParams.setValue("mdc_saldo_doc_ml", mdc_saldo_doc_ml);
			inputParams.setValue("mdc_saldo_doc_ma", mdc_saldo_doc_ma);
			
			str = "Actualizando saldo del documento";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			if(rsMovDocCobDet.getString("tdo_tipo_movimiento").equals("ND"))
			{
				sql = getSQL(getResource("update-smn_mov_documento_cob_cabecera.sql"), inputParams);
				db.exec(sql);
				
				str = "Saldo del documento actualizado";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				str = "Actualizando estatus de la nota";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				sql = getSQL(getResource("update-smn_mov_documento_cob_detalle.sql"), inputParams);
				db.exec(sql);
				
				str = "Estatus de la nota actualizado";	
				bw.write(str);
				bw.flush();
				bw.newLine();
			}
			if(rsMovDocCobDet.getString("tdo_tipo_movimiento").equals("NC"))
			{
				sql = getSQL(getResource("select-doc_modulo_control_fiscal.sql"), inputParams);
				Recordset rsDocModControlFiscal = db.get(sql);
				
				str = "Verificando módulo de control fiscal de la Nota de Crédito";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				rsDocModControlFiscal.first();
				
				if(rsDocModControlFiscal.getString("doc_modulo_control_fiscal")!=null)
				{
					ModControlFiscal=rsDocModControlFiscal.getString("doc_modulo_control_fiscal");
				}
				if (ModControlFiscal=="CME")
				{
					sql = getSQL(getResource("update-update-smn_mov_documento_cob_CME.sql"), inputParams);
					db.exec(sql);
					
					str = "Nota de Credito Aprobada";	
					bw.write(str);
					bw.flush();
					bw.newLine();
				}else
				{
					sql = getSQL(getResource("update-update-smn_mov_documento_cob_COB.sql"), inputParams);
					db.exec(sql);
					
					str = "Nota de Credito Aprobada";	
					bw.write(str);
					bw.flush();
					bw.newLine();
				}
				
			}
		}
		
		
		catch(Throwable e)
		{
			conn.rollback();
			throw e;
		}
		
		finally
		{
			bw.close();
			
			if(rc == 0)
				conn.commit();
			else
				conn.rollback();
			
			if(conn!=null)
				conn.close();
		}
		
		return rc;
	}
}

package registro;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.sql.DataSource;
import dinamica.Db;
import dinamica.GenericTransaction;
import dinamica.Jndi;
import dinamica.Recordset;

public class GenerarMovDetalle extends GenericTransaction
{
	
	public int service(Recordset inputParams) throws Throwable
	{
		int rc = 0;	//variable a retornar.
		
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//establecer la conexion con la base de datos.
		
			DataSource ds = Jndi.getDataSource(jndiName); 
			Connection conn = ds.getConnection();
			this.setConnection(conn);
		
		//**
		
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		  
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/logGenerarMovDetalle_"+fechaActual+".txt";
		else
			file = "./logGenerarMovDetalle_"+fechaActual+".txt";
		
		File newLogFile = new File(file);
		FileWriter fw;
		String str="";
			
		if(!newLogFile.exists())
			fw = new FileWriter(newLogFile);
		else
			fw = new FileWriter(newLogFile,true);
			
		BufferedWriter bw=new BufferedWriter(fw);
			
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());	
			
		conn.setAutoCommit(false);
	
		try
		{
			str = "----------"+timestamp+"----------";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			bw.newLine();
			
			Db db = getDb(); //objeto de conexion.
			String sql;
			double rco_monto_bruto_cob_ml;
			double rco_monto_bruto_cob_ma;
			double mdd_diferencia_cambiario;
			double mdd_monto_ml;
			double mdd_monto_ma;
			double mdc_saldo_doc_ml;
			double mdc_saldo_doc_ma;
			String mdc_estatus_financiero;
			String mdc_estatus_proceso="";
			double dyr_porcentaje_base;
			double dyr_porcentaje_descuento;
			double mdd_monto_descuento_ml;
			double mdd_monto_descuento_ma;
			double total_monto_descuento_ma;
			double total_monto_descuento_ml;
			
			str = "Consultando relacion de cobranza ID="+inputParams.getInt("smn_relacion_cobranza_id")+"...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_relacion_cobranza.sql"),inputParams);
			Recordset rsRelCob = db.get(sql);
			
			rsRelCob.first();
			
			inputParams.setValue("smn_documento_id", rsRelCob.getInt("smn_documento_id"));
			inputParams.setValue("rco_numero_documento", rsRelCob.getInt("rco_numero_documento"));
			inputParams.setValue("smn_cliente_rf", rsRelCob.getInt("smn_cliente_rf"));
			
			if(rsRelCob.getString("smn_moneda_rf")!=null)
				inputParams.setValue("smn_moneda_rf", rsRelCob.getInt("smn_moneda_rf"));
			
			inputParams.setValue("rco_fecha_registro", rsRelCob.getDate("rco_fecha_registro"));
			
			if(rsRelCob.getString("smn_tasa_rf")!=null)
				inputParams.setValue("smn_tasa_rf", rsRelCob.getInt("smn_tasa_rf"));
			
			rco_monto_bruto_cob_ml=rsRelCob.getDouble("rco_monto_bruto_cob_ml");
			
			if(rsRelCob.getString("rco_monto_bruto_cob_ma")!=null)
				rco_monto_bruto_cob_ma=rsRelCob.getDouble("rco_monto_bruto_cob_ma");
			else
				rco_monto_bruto_cob_ma=0;
			
			str = "Consultando documento de cobranza ID="+inputParams.getInt("smn_documento_id")+"...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_documento.sql"),inputParams);
			Recordset rsDocumento = db.get(sql);
			
			rsDocumento.first();
			
			inputParams.setValue("smn_tipo_documento_id", rsDocumento.getInt("smn_tipo_documento_id"));
			
			str = "Consultando documentos relacionados a la cobranza ID="+inputParams.getInt("smn_relacion_cobranza_id")+"...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_rel_cob_documento.sql"),inputParams);
			Recordset rsRelCobDoc = db.get(sql);
			
			if(rsRelCobDoc.getRecordCount()>0)
			{
				str = "Se encontraron "+rsRelCobDoc.getRecordCount()+" documentos relacionados a la cobranza";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				while (rsRelCobDoc.next()) 
				{
					str = "Procesando documento ID="+rsRelCobDoc.getInt("smn_mov_documento_cob_cab_id");	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					inputParams.setValue("smn_mov_doc_cob_cab_id", rsRelCobDoc.getInt("smn_mov_documento_cob_cab_id"));
					
					str = "Consultando documento cabecera ID="+inputParams.getInt("smn_mov_doc_cob_cab_id")+"...";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					sql = getSQL(getResource("select-smn_mov_documento_cob_cab.sql"),inputParams);
					Recordset rsRelMovDocCobCab = db.get(sql);
					
					rsRelMovDocCobCab.first();
					
					mdc_saldo_doc_ml=rsRelMovDocCobCab.getDouble("mdc_saldo_doc_ml");
					
					if(rsRelMovDocCobCab.getString("mdc_saldo_doc_ma")!=null)
						mdc_saldo_doc_ma=rsRelMovDocCobCab.getDouble("mdc_saldo_doc_ma");
					else
						mdc_saldo_doc_ma=0;
					
					if(inputParams.getDouble("rco_diferencial_ma")>0)
					{
						str = "Es un abono a factura";	
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						mdd_monto_ml=rco_monto_bruto_cob_ml;
						mdd_monto_ma=rco_monto_bruto_cob_ma;
					}
					else
					{
						mdd_monto_ml=mdc_saldo_doc_ml;
						mdd_monto_ma=mdc_saldo_doc_ma;
					}
					
					mdd_diferencia_cambiario=rco_monto_bruto_cob_ml-mdd_monto_ml;
					mdc_saldo_doc_ml-=mdd_monto_ml;
					mdc_saldo_doc_ma-=mdd_monto_ma;
					
					inputParams.setValue("mdd_monto_ml", mdd_monto_ml*-1);
					inputParams.setValue("mdd_monto_ma", mdd_monto_ma*-1);
					inputParams.setValue("mdd_diferencia_cambiario", mdd_diferencia_cambiario);
					inputParams.setValue("mdc_saldo_doc_ml", mdc_saldo_doc_ml);
					inputParams.setValue("mdc_saldo_doc_ma", mdc_saldo_doc_ma);
					
					str = "Validando estatus financiero...";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					if(mdc_saldo_doc_ml>0)
						mdc_estatus_financiero="PE";
					else
						mdc_estatus_financiero="EP";
					
					str = "Validando estatus del proceso...";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					if(mdc_estatus_financiero.equals("EP"))
						mdc_estatus_proceso="AP";
					else
					if(mdc_estatus_financiero.equals("PE"))
						mdc_estatus_proceso="AB";
					
					inputParams.setValue("mdc_estatus_financiero", mdc_estatus_financiero);
					inputParams.setValue("mdc_estatus_proceso", mdc_estatus_proceso);
					
					sql = getSQL(getResource("select-smn_rel_cob_descuento.sql"),inputParams);
					Recordset rsRelCobDesc = db.get(sql);
					
					str = "consultando relacion cobranza descuento...";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					if(rsRelCobDesc.getRecordCount()>0)
					{
						str = "Calculando descuentos...";	
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						total_monto_descuento_ml=0;
						total_monto_descuento_ma=0;
						
						while(rsRelCobDesc.next())
						{
							dyr_porcentaje_base=rsRelCobDesc.getDouble("dyr_porcentaje_base");
							dyr_porcentaje_descuento=rsRelCobDesc.getDouble("dyr_porcentaje_descuento");
							
							mdd_monto_descuento_ml=(dyr_porcentaje_base*mdd_monto_ml)/100;
							mdd_monto_descuento_ml=(dyr_porcentaje_descuento*mdd_monto_descuento_ml)/100;
							mdd_monto_descuento_ma=(dyr_porcentaje_base*mdd_monto_ma)/100;
							mdd_monto_descuento_ma=(dyr_porcentaje_descuento*mdd_monto_descuento_ma)/100;
							
							total_monto_descuento_ml+=mdd_monto_descuento_ml;
							total_monto_descuento_ma+=mdd_monto_descuento_ma;
						}//end-while rsRelCobDesc
						
						inputParams.setValue("total_monto_descuento_ml",total_monto_descuento_ml);
						inputParams.setValue("total_monto_descuento_ma",total_monto_descuento_ma);
					}
					
					str = "Registrando documento detalle...";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					sql = getSQL(getResource("insert-smn_mov_documento_cob_detalle.sql"),inputParams);
					db.exec(sql);
					
					str = "*Documento detalle registrado exitosamente*";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					str = "Actualizando documento cabecera...";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					sql = getSQL(getResource("update-smn_mov_documento_cob_cab.sql"),inputParams);
					db.exec(sql);
					
					str = "*Documento cabecera actualizado exitosamente*";	
					bw.write(str);
					bw.flush();
					bw.newLine();
				
				} //endwhile
			}
			else
			{
				str = "No hay documentos relacionados a la cobranza ID="+inputParams.getInt("smn_relacion_cobranza_id");	
				bw.write(str);
				bw.flush();
				bw.newLine();
			}
		}
		catch(Throwable e)
		{
			bw.close();
			conn.rollback();
			throw e;
		}
		
		finally
		{		
			bw.close();
			if(rc==0)
				conn.commit();
			else
				conn.rollback();
			
			if(conn!=null)
				conn.close();
		}
		
		return rc;
	}
}

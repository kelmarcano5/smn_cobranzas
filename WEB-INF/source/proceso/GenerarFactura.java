package proceso;

import dinamica.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.sql.DataSource;

public class GenerarFactura extends GenericTransaction{

	public int service(Recordset inputParams) throws Throwable 
	{ 
		int rc = 0;	//variable a retornar.
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		String fechaActual= sdformat.format(new Date());
        String sql;
        double mdd_monto_ml;
        double mdd_monto_ma;
        double mdd_diferencia_cambiario;
        double mdd_monto_descuento_ml;
        double mdd_monto_descuento_ma;
		double fca_monto_factura_ml;
		double fca_monto_factura_ma;
		double fca_monto_impuesto_ml;
		double fca_monto_impuesto_ma;
		double fca_monto_descuento_ml=0;
		double fca_monto_descuento_ma=0;
		double fca_monto_bonificacion_ml=0;
		double fca_monto_bonificacion_ma=0;
		double fca_monto_diferencial_ml=0;
		double fca_monto_diferencial_ma=0;
		double fca_monto_neto_ml;
		double fca_monto_neto_ma;
		
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//establecer la conexion con la base de datos.
		
			DataSource ds = Jndi.getDataSource(jndiName); 
			Connection conn = ds.getConnection();
			this.setConnection(conn);
		
		//**
		
		conn.setAutoCommit(false);
		
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		  
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/logGenerarFacturaCob_"+fechaActual+".txt";
		else
			file = "./logGenerarFacturaCob_"+fechaActual+".txt";
		
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
			
			str = "Validando estatus financiero del documento";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_mov_documento_cob_cab.sql"), inputParams);
			Recordset rsMovDocCobCab = db.get(sql);
			
			rsMovDocCobCab.first();
			
			if(!rsMovDocCobCab.getString("mdc_estatus_financiero").equals("PA"))
			{
				str = "El documento no esta PAGADO";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc=1;
				return rc;
			}
			else
			{
				str = "Estatus validado";	
				bw.write(str);
				bw.flush();
				bw.newLine();
			}
			
			str = "Consultando y procesando informacion del documento a generar...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			inputParams.setValue("smn_entidad_rf", rsMovDocCobCab.getInt("smn_entidad_rf"));
			
			if(rsMovDocCobCab.getString("smn_sucursal_rf")!=null)
				inputParams.setValue("smn_sucursal_rf", rsMovDocCobCab.getInt("smn_sucursal_rf"));
			else
				inputParams.setValue("smn_sucursal_rf", 0);
			
			inputParams.setValue("smn_documento_id", rsMovDocCobCab.getInt("smn_documento_id"));
			inputParams.setValue("smn_cliente_rf", rsMovDocCobCab.getInt("smn_cliente_rf"));
			
			if(rsMovDocCobCab.getString("smn_moneda_rf")!=null)
				inputParams.setValue("smn_moneda_rf", rsMovDocCobCab.getInt("smn_moneda_rf"));
			else
				inputParams.setValue("smn_moneda_rf", 0);
			
			inputParams.setValue("mdc_numero_doc_origen", rsMovDocCobCab.getInt("mdc_numero_doc_origen"));
			inputParams.setValue("smn_documento_rf", rsMovDocCobCab.getInt("smn_documento_rf"));
			
			str = "Consultando documento general destino con naturaleza FC";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_documento_cme.sql"), inputParams);
			Recordset rsDoc_cme = db.get(sql);
			
			if(rsDoc_cme.getRecordCount()>0)
			{
				rsDoc_cme.first();
				
				inputParams.setValue("smn_documento_id_cme", rsDoc_cme.getInt("smn_documento_id"));
			}
			else
			{
				str = "No se encuentra un documento en comercial con naturaleza FC relacionado al documento general de cobranzas";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc=1;
				return rc;
			}
			
			str = "Calculando secuencia...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-secuencia.sql"), inputParams);
			Recordset rsSecuencia = db.get(sql);
			
			if(rsSecuencia.getRecordCount()>0)
			{
				rsSecuencia.first();
				
				if(rsSecuencia.getString("fca_numero_documento")!=null)
					inputParams.setValue("fca_numero_documento", rsSecuencia.getInt("fca_numero_documento")+1);
				else
					inputParams.setValue("fca_numero_documento", 1);
			}
			else
				inputParams.setValue("fca_numero_documento", 1);
			
			str = "Consultando control fiscal...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_control_fiscal.sql"), inputParams);
			Recordset rsControlFiscal = db.get(sql);
			
			if(rsControlFiscal.getRecordCount()>0)
			{
				inputParams.setValue("fca_numero_control_fiscal", rsControlFiscal.getInt("fca_numero_control_fiscal"));
				
				if(rsControlFiscal.getString("cfd_serie")!=null)
				{
					inputParams.setValue("smn_control_serie_fiscal_id", rsControlFiscal.getInt("cfd_serie"));
				}
				else
				{
					str = "La serie del control fiscal esta vacio";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc=1;
					return rc;
				}
			}
			else
			{
				str = "No se encuentra el control fiscal relacionado al documento comercial con ID"+inputParams.getValue("smn_documento_id_cme");
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc=1;
				return rc;
			}
			
			str = "Consultando rif del cliente...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_cliente.sql"), inputParams);
			Recordset rsCliente = db.get(sql);
			
			if(rsCliente.getRecordCount()>0)
			{
				rsCliente.first();
				
				if(rsCliente.getString("aux_rif")!=null)
					inputParams.setValue("aux_rif", rsCliente.getString("aux_rif"));
				else
				{
					str = "El rif del auxiliar cliente esta vacio";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc=1;
					return rc;
				}
				
				inputParams.setValue("smn_auxiliar_id", rsCliente.getInt("smn_auxiliar_id"));
			}
			else
			{
				str = "No se encuentra el cliente";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc=1;
				return rc;
			}
			
			str = "Consultando direccion del cliente...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_direccion.sql"), inputParams);
			Recordset rsDireccion = db.get(sql);
			
			if(rsDireccion.getRecordCount()>0)
			{
				rsDireccion.first();
				
				if(rsDireccion.getString("dir_descripcion")!=null)
					inputParams.setValue("dir_descripcion", rsDireccion.getString("dir_descripcion"));
				else
				{
					str = "La direccion del auxiliar cliente esta vacio";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc=1;
					return rc;
				}
			}
			else
			{
				str = "No se encuentra la direccion del cliente";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc=1;
				return rc;
			}
			
			str = "Consultando montos del detalle del documento...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_mov_documento_cob_detalle.sql"), inputParams);
			Recordset rsMovDocCobDet = db.get(sql);
			
			if(rsMovDocCobDet.getRecordCount()>0)
			{
				str = "Calculando montos de la factura...";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				rsMovDocCobDet.first();
				
				mdd_monto_ml=rsMovDocCobDet.getDouble("mdd_monto_ml");
				
				if(rsMovDocCobDet.getString("mdd_diferencia_cambiario")!=null)
					mdd_diferencia_cambiario=rsMovDocCobDet.getDouble("mdd_diferencia_cambiario");
				else
					mdd_diferencia_cambiario=0;
				
				inputParams.setValue("mdd_diferencia_cambiario", mdd_diferencia_cambiario);
				
				if(rsMovDocCobDet.getString("mdd_monto_descuento_ml")!=null)
					mdd_monto_descuento_ml=rsMovDocCobDet.getDouble("mdd_monto_descuento_ml");
				else
					mdd_monto_descuento_ml=0;
				
				if(rsMovDocCobDet.getString("mdd_monto_ma")!=null)
					mdd_monto_ma=rsMovDocCobDet.getDouble("mdd_monto_ma");
				else
					mdd_monto_ma=0;
				
				if(rsMovDocCobDet.getString("mdd_monto_descuento_ma")!=null)
					mdd_monto_descuento_ma=rsMovDocCobDet.getDouble("mdd_monto_descuento_ma");
				else
					mdd_monto_descuento_ma=0;
				
				fca_monto_factura_ml=mdd_monto_ml+mdd_diferencia_cambiario-mdd_monto_descuento_ml;
				fca_monto_factura_ma=mdd_monto_ma+mdd_diferencia_cambiario-mdd_monto_descuento_ma;
				
				inputParams.setValue("fca_monto_factura_ml",fca_monto_factura_ml);
				inputParams.setValue("fca_monto_factura_ma",fca_monto_factura_ma);
			}
			else
			{
				str = "El documento no tiene detalles";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc=1;
				return rc;
			}
			
			str = "Consultando impuestos del documento...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_pedido_impuestos.sql"), inputParams);
			Recordset rsPedidoImp = db.get(sql);
			
			if(rsPedidoImp.getRecordCount()>0)
			{
				str = "calculando montos de impuestos...";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				rsPedidoImp.first();
				
				inputParams.setValue("total_monto_impuesto_ml", rsPedidoImp.getDouble("total_monto_impuesto_ml"));
				fca_monto_impuesto_ml=rsPedidoImp.getDouble("total_monto_impuesto_ml");
				
				if(rsPedidoImp.getString("total_monto_impuesto_ma")!=null)
				{
					inputParams.setValue("total_monto_impuesto_ma", rsPedidoImp.getDouble("total_monto_impuesto_ma"));
					fca_monto_impuesto_ma=rsPedidoImp.getDouble("total_monto_impuesto_ma");
				}
				else
				{
					inputParams.setValue("total_monto_impuesto_ma", 0);
					fca_monto_impuesto_ma=0;
				}
			}
			else
			{
				str = "No hay impuestos para calcular";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				inputParams.setValue("total_monto_impuesto_ml", 0);
				fca_monto_impuesto_ml=0;
				inputParams.setValue("total_monto_impuesto_ma", 0);
				fca_monto_impuesto_ma=0;
			}
			
			str = "calculando monto neto en ML y MA...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			fca_monto_neto_ml=fca_monto_impuesto_ml-fca_monto_descuento_ml+fca_monto_bonificacion_ml+fca_monto_diferencial_ml;
			fca_monto_neto_ma=fca_monto_impuesto_ma-fca_monto_descuento_ma+fca_monto_bonificacion_ma+fca_monto_diferencial_ma;
			
			inputParams.setValue("fca_monto_neto_ml", fca_monto_neto_ml);
			inputParams.setValue("fca_monto_neto_ma", fca_monto_neto_ma);
			
			str = "Registrando factura...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("insert-smn_factura_cabecera.sql"), inputParams);
			Recordset rsFacturaCab = db.get(sql);
			
			str = "Factura registrada";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			rsFacturaCab.first();
			inputParams.setValue("smn_factura_cabecera_id", rsFacturaCab.getInt("factura_cabecera_id"));
			
			str = "Actualizando numero de control fiscal...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("update-smn_control_fiscal_documento.sql"), inputParams);
			db.exec(sql);
			
			str = "Numero de control fiscal actualizado";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			str = "Consultando pedido relacionado al documento de cobranza...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_pedido_cabecera.sql"), inputParams);
			Recordset rsPedidoCab = db.get(sql);
			
			if(rsPedidoCab.getRecordCount()>0)
			{
				rsPedidoCab.first();
				inputParams.setValue("smn_pedido_cabecera_id", rsPedidoCab.getInt("smn_pedido_cabecera_id"));
			}
			else
			{
				str = "El documento no tiene pedido relacionado";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc=1;
				return rc;
			}
			
			str = "Registrando relacion pedido factura...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("insert-smn_rel_pedido_factura.sql"), inputParams);
			db.exec(sql);
			
			str = "Relacion pedido factura registrado";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			str = "Consultando pedidos detalle...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_pedido_detalle.sql"), inputParams);
			Recordset rsPedidoDet = db.get(sql);
			
			if(rsPedidoDet.getRecordCount()>0)
			{
				while(rsPedidoDet.next())
				{
					inputParams.setValue("smn_pedido_detalle_id", rsPedidoDet.getInt("smn_pedido_detalle_id"));
					inputParams.setValue("smn_servicios_rf", rsPedidoDet.getInt("smn_servicios_rf"));
					inputParams.setValue("smn_item_rf", rsPedidoDet.getInt("smn_item_rf"));
					inputParams.setValue("fco_monto_dif_camb_impuesto_ml", mdd_diferencia_cambiario*inputParams.getDouble("total_monto_impuesto_ml"));
					
					str = "Registrando factura complemento...";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					sql = getSQL(getResource("insert-smn_factura_complemento.sql"), inputParams);
					db.exec(sql);
					
					str = "Factura complemento registrado";	
					bw.write(str);
					bw.flush();
					bw.newLine();
				}//end-while
			}
			else
			{
				str = "El documento no tiene pedido detalle relacionado";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc=1;
				return rc;
			}
			
			str = "Actualizando estatus movimiento documento cobranza cabecera...";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("update-smn_mov_documento_cob_cab.sql"), inputParams);
			db.exec(sql);
			
			str = "Estatus movimiento documento cobranza cabecera actualizado";	
			bw.write(str);
			bw.flush();
			bw.newLine();
		}
		catch(Throwable e)
		{
			str = "Ocurrio un error tecnico en el proceso";
			bw.write(str);
			bw.flush();
			bw.newLine();
			conn.rollback();
			throw e;
		}
		
		finally
		{			
			if(rc == 0)
			{
				str = "*Se genero la factura correctamente*";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				conn.commit();
			}
			else
				conn.rollback();
			
			if(conn!=null)
				conn.close();
			
			bw.close();
		}
		
		return rc;
	}
}

package proceso;

import dinamica.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.sql.DataSource;

public class controlSaldoCliente extends GenericTransaction{

	public int service(Recordset inputParams) throws Throwable 
	{ 
		int rc = 0;	//variable a retornar.
		Double scl_saldo_inicial_ml=0.00;
		Double scl_saldo_inicial_ma=0.00;
		Double scl_saldo_final_ml=0.00;
		Double scl_saldo_final_ma=0.00;
		Double scl_debitos_ml=0.00;
		Double scl_debitos_ma=0.00;
		Double scl_creditos_ml=0.00;
		Double scl_creditos_ma=0.00;
		Double scl_saldo_vencido_ml=0.00;
		Double scl_saldo_vencido_ma=0.00;
		Double scl_porcentaje_deuda_vencida=0.00;
		Boolean existe=false;
		String tipo_movimiento;
		String sql=null;
		Double mdd_saldo_ml=0.00;
		Double mdd_saldo_ma=0.00;
		String mdc_estatus_financiero=null;
		Double cfi_limite_credito=0.00;
		Date scl_fecha=null;
		double rco_porcentaje;
		double rco_monto_bruto_cob_ml;
		double rco_monto_bruto_cob_ma;
		double pde_cantidad_pedido;
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
		Date currency_date = sdformat.parse(fechaActual);
		
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		  
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/logControlSaldoCliente_"+fechaActual+".txt";
		else
			file = "./logControlSaldoCliente_"+fechaActual+".txt";
		
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
			
			str = "Procesando control de saldo del cliente";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			sql = getSQL(getResource("select-smn_relacion_cobranza.sql"), inputParams);
			Recordset rsRelacionCobranza = db.get(sql);
			
			str = "Consultando relacion de cobranza...";
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			if(rsRelacionCobranza.getRecordCount()>0)
			{
				rsRelacionCobranza.first();
				
				if(rsRelacionCobranza.getString("smn_entidad_rf")!=null)
					inputParams.setValue("smn_entidad_rf",rsRelacionCobranza.getInteger("smn_entidad_rf"));
				else
				{
					str = "La relacion de cobranza no tiene entidad registrada";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					return 1;
				}
				
				if(rsRelacionCobranza.getString("smn_sucursal_rf")!=null)
					inputParams.setValue("smn_sucursal_rf",rsRelacionCobranza.getInteger("smn_sucursal_rf"));
					
				if(rsRelacionCobranza.getString("smn_cliente_rf")!=null)
					inputParams.setValue("smn_cliente_rf",rsRelacionCobranza.getInteger("smn_cliente_rf"));
				else
				{
					str = "La relacion de cobranza no tiene cliente registrado";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					return 1;
				}
				
				if(rsRelacionCobranza.getString("rco_monto_bruto_cob_ml")!=null)
					inputParams.setValue("rco_monto_bruto_cob_ml",rsRelacionCobranza.getDouble("rco_monto_bruto_cob_ml"));
				else
				{
					str = "La relacion de cobranza no tiene monto bruto en moneda local registrado";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					return 1;
				}
				
				if(rsRelacionCobranza.getString("rco_monto_bruto_cob_ma")!=null)
					inputParams.setValue("rco_monto_bruto_cob_ma",rsRelacionCobranza.getDouble("rco_monto_bruto_cob_ma"));
				else
					inputParams.setValue("rco_monto_bruto_cob_ma",0);
				
				if(rsRelacionCobranza.getString("smn_moneda_rf")!=null)
					inputParams.setValue("smn_moneda_rf",rsRelacionCobranza.getInteger("smn_moneda_rf"));
				else
					inputParams.setValue("smn_moneda_rf",0);
				
				if(rsRelacionCobranza.getString("smn_rol_id")!=null)
					inputParams.setValue("smn_rol_id",rsRelacionCobranza.getInteger("smn_rol_id"));
				else
					inputParams.setValue("smn_rol_id",0);
				
				sql = getSQL(getResource("select-smn_saldo_cliente.sql"), inputParams);
				Recordset rsSaldoCliente = db.get(sql);
				
				str = "Consultando saldo del cliente...";
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				if(rsSaldoCliente.getRecordCount()>0)
				{
					rsSaldoCliente.first();
					existe=true;
					inputParams.setValue("smn_saldo_cliente_id", rsSaldoCliente.getInt("smn_saldo_cliente_id"));
					scl_saldo_inicial_ml=rsSaldoCliente.getDouble("scl_saldo_inicial_ml");
					scl_debitos_ml=rsSaldoCliente.getDouble("scl_debitos_ml");
					scl_creditos_ml=rsSaldoCliente.getDouble("scl_creditos_ml");
					scl_saldo_final_ml=rsSaldoCliente.getDouble("scl_saldo_final_ml");
					scl_saldo_vencido_ml=rsSaldoCliente.getDouble("scl_saldo_vencido_ml");
					scl_saldo_inicial_ma=rsSaldoCliente.getDouble("scl_saldo_inicial_ma");
					scl_debitos_ma=rsSaldoCliente.getDouble("scl_debitos_ma");
					scl_creditos_ma=rsSaldoCliente.getDouble("scl_creditos_ma");
					scl_saldo_final_ma=rsSaldoCliente.getDouble("scl_saldo_final_ma");
					scl_saldo_vencido_ma=rsSaldoCliente.getDouble("scl_saldo_vencido_ma");
					scl_porcentaje_deuda_vencida=rsSaldoCliente.getDouble("scl_porcentaje_deuda_vencida");
					scl_fecha=rsSaldoCliente.getDate("scl_fecha");
				}
				else
				{
					existe=false;
					scl_saldo_inicial_ml=0.0;
					scl_debitos_ml=0.0;
					scl_creditos_ml=0.0;
					scl_saldo_final_ml=0.0;
					scl_saldo_vencido_ml=0.0;
					scl_saldo_inicial_ma=0.0;
					scl_debitos_ma=0.0;
					scl_creditos_ma=0.0;
					scl_saldo_final_ma=0.0;
					scl_saldo_vencido_ma=0.0;
					scl_porcentaje_deuda_vencida=0.0;
					scl_fecha=null;
				}
				sql = getSQL(getResource("select-smn_rel_cob_documento.sql"), inputParams);
				Recordset rsRelCobDocumento = db.get(sql);
				
				str = "Consultando documentos relacionados a la cobranza...";
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				if(rsRelCobDocumento.getRecordCount()>0)
				{
					while(rsRelCobDocumento.next())
					{
						inputParams.setValue("smn_mov_documento_cob_cab_id", rsRelCobDocumento.getInt("smn_mov_documento_cob_cab_id"));
						
						if(rsRelCobDocumento.getString("smn_tipo_documento_id")!=null)
						{
							inputParams.setValue("smn_tipo_documento_id_mdc",rsRelCobDocumento.getInt("smn_tipo_documento_id"));
						}
						else
						{
							str = "El documento no tiene tipo de documento de cobranza asociado";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							return 1;
						}
						
						if(rsRelCobDocumento.getString("smn_documento_id")!=null)
						{
							inputParams.setValue("smn_documento_id_mdc",rsRelCobDocumento.getInt("smn_documento_id"));
						}
						else
						{
							str = "El movimiento no tiene documento de cobranza asociado";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							return 1;
						}
						
						if(rsRelCobDocumento.getString("smn_promotor_rf")!=null)
						{
							inputParams.setValue("smn_promotor_rf",rsRelCobDocumento.getInt("smn_promotor_rf"));
						}
						else
						{
							inputParams.setValue("smn_promotor_rf",0);
						}
						
						if(rsRelCobDocumento.getString("smn_rol_id")!=null)
						{
							inputParams.setValue("smn_rol_id",rsRelCobDocumento.getInt("smn_rol_id"));
						}
						else
						{
							inputParams.setValue("smn_rol_id",0);
						}
						
						if(rsRelCobDocumento.getString("tdo_tipo_movimiento")!=null)
						{
							inputParams.setValue("tdo_tipo_movimiento",rsRelCobDocumento.getString("tdo_tipo_movimiento"));
							tipo_movimiento=rsRelCobDocumento.getString("tdo_tipo_movimiento");
						}
						else
						{
							str = "El documento no tiene tipo de movimiento";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							return 1;
						}
						
						if(rsRelCobDocumento.getString("mdd_saldo_ml")!=null)
						{
							inputParams.setValue("mdd_saldo_ml",rsRelCobDocumento.getDouble("mdd_saldo_ml"));
							mdd_saldo_ml=rsRelCobDocumento.getDouble("mdd_saldo_ml");
						}
						else
						{
							str = "El documento no tiene saldo en moneda local";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							return 1;
						}
						
						if(rsRelCobDocumento.getString("mdd_saldo_ma")!=null)
						{
							inputParams.setValue("mdd_saldo_ma",rsRelCobDocumento.getDouble("mdd_saldo_ma"));
							mdd_saldo_ma=rsRelCobDocumento.getDouble("mdd_saldo_ma");
						}
						else
						{
							inputParams.setValue("mdd_saldo_ma",0.0);
							mdd_saldo_ma=0.0;
						}
						
						if(rsRelCobDocumento.getString("mdc_estatus_financiero")!=null)
						{
							inputParams.setValue("mdc_estatus_financiero",rsRelCobDocumento.getString("mdc_estatus_financiero"));
							mdc_estatus_financiero=rsRelCobDocumento.getString("mdc_estatus_financiero");
						}
						else
						{
							str = "El documento no tiene estatus financiero registrado";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							return 1;
						}
						
						sql = getSQL(getResource("select-smn_cliente.sql"), inputParams);
						Recordset rsCliente = db.get(sql);
						
						str = "Consultando Cliente...";
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						if(rsCliente.getRecordCount()>0)
						{
							rsCliente.first();
							
							if(rsCliente.getString("cfi_limite_credito")!=null)
							{
								inputParams.setValue("cfi_limite_credito",rsCliente.getDouble("cfi_limite_credito"));
								cfi_limite_credito=rsCliente.getDouble("cfi_limite_credito");
							}
							else
							{
								str = "El limite de credito del cliente esta vacio";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								return 1;
							}
						}
						else
						{
							str = "No se encontro la condicion financiera del cliente";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							return 1;
						}
						
						if(tipo_movimiento.equals("FC") || tipo_movimiento.equals("ND"))
						{
							scl_saldo_inicial_ml=scl_saldo_final_ml;
							scl_saldo_inicial_ma=scl_saldo_final_ma;
							scl_saldo_final_ml+=mdd_saldo_ml;
							scl_saldo_final_ma+=mdd_saldo_ma;
							scl_debitos_ml+=mdd_saldo_ml;
							scl_debitos_ma+=mdd_saldo_ma;
							
							if(mdc_estatus_financiero.equals("VE"))
							{
								scl_saldo_vencido_ml+=mdd_saldo_ml;
								scl_saldo_vencido_ma+=mdd_saldo_ma;
								scl_porcentaje_deuda_vencida=scl_saldo_vencido_ml/cfi_limite_credito;
							}
						}
						else
						if(tipo_movimiento.equals("RC") || tipo_movimiento.equals("NC"))
						{
							scl_saldo_inicial_ml=scl_saldo_final_ml;
							scl_saldo_inicial_ma=scl_saldo_final_ma;
							scl_saldo_final_ml-=mdd_saldo_ml;
							scl_saldo_final_ma-=mdd_saldo_ma;
							scl_creditos_ml+=mdd_saldo_ml;
							scl_creditos_ma+=mdd_saldo_ma;
							
							if(mdc_estatus_financiero.equals("VE"))
							{
								scl_saldo_vencido_ml+=mdd_saldo_ml;
								scl_saldo_vencido_ma+=mdd_saldo_ma;
								scl_porcentaje_deuda_vencida=scl_saldo_vencido_ml/cfi_limite_credito;
							}
						}
						
						inputParams.setValue("scl_saldo_inicial_ml",scl_saldo_inicial_ml);
						inputParams.setValue("scl_saldo_inicial_ma",scl_saldo_inicial_ma);
						inputParams.setValue("scl_saldo_final_ml",scl_saldo_final_ml);
						inputParams.setValue("scl_saldo_final_ma",scl_saldo_final_ma);
						inputParams.setValue("scl_creditos_ml",scl_creditos_ml);
						inputParams.setValue("scl_creditos_ma",scl_creditos_ma);
						inputParams.setValue("scl_debitos_ml",scl_debitos_ml);
						inputParams.setValue("scl_debitos_ma",scl_debitos_ma);
						inputParams.setValue("scl_saldo_vencido_ml",scl_saldo_vencido_ml);
						inputParams.setValue("scl_saldo_vencido_ma",scl_saldo_vencido_ma);
						inputParams.setValue("scl_porcentaje_deuda_vencida",scl_porcentaje_deuda_vencida);
						
						if(!existe)
						{
							str = "Registrando saldo del cliente...";
							bw.write(str);
							bw.flush();
							bw.newLine();
							
							sql = getSQL(getResource("insert-smn_saldo_cliente.sql"), inputParams);
							db.exec(sql);
							
							str = "Saldo del cliente registrado exitosamente";
							bw.write(str);
							bw.flush();
							bw.newLine();
						}
						else
						{
							if(scl_fecha.compareTo(currency_date)==0)
							{
								str = "Actualizando saldo del cliente...";
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								sql = getSQL(getResource("update-smn_saldo_cliente.sql"), inputParams);
								db.exec(sql);
								
								str = "Saldo del cliente actualizado exitosamente";
								bw.write(str);
								bw.flush();
								bw.newLine();
							}
							else
							{
								str = "Registrando saldo del cliente...";
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								sql = getSQL(getResource("insert-smn_saldo_cliente.sql"), inputParams);
								db.exec(sql);
								
								str = "Saldo del cliente registrado exitosamente";
								bw.write(str);
								bw.flush();
								bw.newLine();
							}
						}
					}//END WHILE
					
					if(mdc_estatus_financiero.equals("EP"))
					{
						str = "Actualizando estatus financiero a PAGADO...";
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						sql = getSQL(getResource("update-smn_mov_documento_cob_cab.sql"), inputParams);
						db.exec(sql);
						
						str = "Estatus financiero actualizado";
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						//Registrar comisiones...
						
						str = "Buscando coincidencias en las reglas de comisiones...";
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						sql = getSQL(getResource("select-smn_reglas_comisiones.sql"), inputParams);
						Recordset rsReglasComisiones = db.get(sql);
						
						if(rsReglasComisiones.getRecordCount()>0)
						{
							while(rsReglasComisiones.next())
							{
								str = "Regla encontrada ID: "+rsReglasComisiones.getInt("smn_reglas_comisiones_id");
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								if(rsReglasComisiones.getString("smn_documento_id")!=null)
									inputParams.setValue("smn_documento_id_rco", rsReglasComisiones.getInt("smn_documento_id"));
								else
									inputParams.setValue("smn_documento_id_rco",0);
								
								inputParams.setValue("smn_reglas_comisiones_id", rsReglasComisiones.getInt("smn_reglas_comisiones_id"));
								
								str = "Calculando secuencia de la tabla de comisiones...";
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								sql = getSQL(getResource("select-smn_comisiones.sql"), inputParams);
								Recordset rsComisiones = db.get(sql);
								
								if(rsComisiones.getRecordCount()>0)
								{
									rsComisiones.first();
									if(rsComisiones.getString("com_numero_documento")!=null)
										inputParams.setValue("com_numero_documento",rsComisiones.getInt("com_numero_documento"));
									else
										inputParams.setValue("com_numero_documento",1);	
								}
								else
								{
									inputParams.setValue("com_numero_documento",1);	
								}
								
								if(rsReglasComisiones.getString("smn_auxiliar_rf")!=null)
									inputParams.setValue("smn_cliente_rf", rsReglasComisiones.getInt("smn_auxiliar_rf"));
								else
									inputParams.setValue("smn_cliente_rf",0);
								
								if(rsReglasComisiones.getString("smn_promotor_rf")!=null)
									inputParams.setValue("smn_promotor_rf", rsReglasComisiones.getInt("smn_promotor_rf"));
								else
									inputParams.setValue("smn_promotor_rf",0);
								
								if(rsReglasComisiones.getString("smn_rol_id")!=null)
									inputParams.setValue("smn_rol_id", rsReglasComisiones.getInt("smn_rol_id"));
								else
									inputParams.setValue("smn_rol_id",0);
								
								if(rsReglasComisiones.getString("rco_monto_bruto_cob_ml")!=null)
								{
									inputParams.setValue("rco_monto_bruto_cob_ml", rsReglasComisiones.getDouble("rco_monto_bruto_cob_ml"));
									rco_monto_bruto_cob_ml=rsReglasComisiones.getDouble("rco_monto_bruto_cob_ml");
								}
								else
								{
									inputParams.setValue("rco_monto_bruto_cob_ml",0);
									rco_monto_bruto_cob_ml=0;
								}
								
								if(rsReglasComisiones.getString("rco_monto_bruto_cob_ma")!=null)
								{
									inputParams.setValue("rco_monto_bruto_cob_ma", rsReglasComisiones.getDouble("rco_monto_bruto_cob_ma"));
									rco_monto_bruto_cob_ma=rsReglasComisiones.getDouble("rco_monto_bruto_cob_ma");
								}
								else
								{
									inputParams.setValue("rco_monto_bruto_cob_ma",0);
									rco_monto_bruto_cob_ma=0;
								}
								
								if(rsReglasComisiones.getString("smn_moneda_rf")!=null)
									inputParams.setValue("smn_moneda_rf", rsReglasComisiones.getInt("smn_moneda_rf"));
								else
									inputParams.setValue("smn_moneda_rf",0);
								
								if(rsReglasComisiones.getString("pde_cantidad_pedido")!=null)
								{
									inputParams.setValue("pde_cantidad_pedido", rsReglasComisiones.getDouble("pde_cantidad_pedido"));
									pde_cantidad_pedido=rsReglasComisiones.getDouble("pde_cantidad_pedido");
								}
								else
								{
									inputParams.setValue("pde_cantidad_pedido",0);
									pde_cantidad_pedido=0;
								}
								
								if(rsReglasComisiones.getString("rco_porcentaje")!=null)
								{
									inputParams.setValue("rco_porcentaje", rsReglasComisiones.getDouble("rco_porcentaje"));
									rco_porcentaje=rsReglasComisiones.getDouble("rco_porcentaje");
								}
								else
								{
									inputParams.setValue("rco_porcentaje",0);
									rco_porcentaje=0;
								}
								
								if(rsReglasComisiones.getString("rco_valor")!=null)
								{
									inputParams.setValue("com_monto_comision_ml", rsReglasComisiones.getDouble("rco_valor")*pde_cantidad_pedido);
									inputParams.setValue("com_monto_comision_ma", rsReglasComisiones.getDouble("rco_valor")*pde_cantidad_pedido);
								}
								else
								{
									inputParams.setValue("com_monto_comision_ml", (rco_monto_bruto_cob_ml*rco_porcentaje)/100);
									inputParams.setValue("com_monto_comision_ma", (rco_monto_bruto_cob_ma*rco_porcentaje)/100);
								}
								
								str = "Registrando comision...";
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								sql = getSQL(getResource("insert-smn_comisiones.sql"), inputParams);
								db.exec(sql);
								
								str = "Comision registrada";
								bw.write(str);
								bw.flush();
								bw.newLine();
							} //END WHILE
						}
					}
				}
				else
				{
					str = "La relacion de cobranza no tiene documentos relacionados";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					return 1;
				}				
			}
			else
			{
				str = "La relacion de cobranza no esta registrada";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				return 1;
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

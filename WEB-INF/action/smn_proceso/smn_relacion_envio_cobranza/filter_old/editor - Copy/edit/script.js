setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
document.form1.rec_numero.value='${fld:rec_numero@#,###,###}';
setComboValue('smn_cliente_rf','${fld:smn_cliente_rf}','form1');
document.form1.rec_fecha_generacion.value='${fld:rec_fecha_generacion@dd-MM-yyyy}';
document.form1.rec_fecha_entrega.value='${fld:rec_fecha_entrega@dd-MM-yyyy}';
document.form1.rec_ejecutivo_recibe.value='${fld:rec_ejecutivo_recibe@js}';
document.form1.rec_monto_ml.value='${fld:rec_monto_ml@#,###,##0.00}';
document.form1.rec_monto_ma.value='${fld:rec_monto_ma@#,###,##0.00}';
document.form1.rec_cantidad_documento.value='${fld:rec_cantidad_documento@#,###,###}';
setComboValue('rec_estatus','${fld:rec_estatus}','form1');
document.form1.id.value='${fld:smn_relacion_envio_cobranza_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


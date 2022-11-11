setComboValue('smn_relacion_cobranza_id','${fld:smn_relacion_cobranza_id}','form1');
setComboValue('smn_reglas_comisiones_id','${fld:smn_reglas_comisiones_id}','form1');
setComboValue('smn_cliente_rf','${fld:smn_cliente_rf}','form1');
document.form1.smn_rol_id.value='${fld:smn_rol_id@#,###,###}';
document.form1.com_monto_relacion_ml.value='${fld:com_monto_relacion_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.com_monto_relacion_ma.value='${fld:com_monto_relacion_ma@#,###,##0.00}';
document.form1.com_porcentaje.value='${fld:com_porcentaje@#,###,##0.00}';
document.form1.com_monto_comision_ml.value='${fld:com_monto_comision_ml@#,###,##0.00}';
document.form1.com_monto_comision_ma.value='${fld:com_monto_comision_ma@#,###,##0.00}';
setComboValue('com_estatus_proceso','${fld:com_estatus_proceso}','form1');
setComboValue('com_estatus_financiero','${fld:com_estatus_financiero}','form1');
document.form1.com_motivo_rechazo.value='${fld:com_motivo_rechazo@js}';
document.form1.id.value='${fld:smn_rel_comisiones_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


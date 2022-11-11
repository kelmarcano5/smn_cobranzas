document.form1.smn_clave_aprobacion_pedido.value='${fld:smn_clave_aprobacion_pedido@#,###,###}';
setComboValue('smn_relacion_cobranza_id','${fld:smn_relacion_cobranza_id}','form1');
setComboValue('smn_codigo_retenciones_rf','${fld:smn_codigo_retenciones_rf}','form1');
document.form1.rcr_monto_retenciones_ml.value='${fld:rcr_monto_retenciones_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.rcr_monto_retenciones_ma.value='${fld:rcr_monto_retenciones_ma@#,###,##0.00}';
document.form1.id.value='${fld:smn_relacion_cobranza_retenciones_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


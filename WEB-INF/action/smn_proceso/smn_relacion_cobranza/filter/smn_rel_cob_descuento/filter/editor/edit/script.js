document.form1.smn_relacion_cobranza_id.value='${fld:smn_relacion_cobranza_id@#,###,###}';
setComboValue('smn_codigo_descuento_rf','${fld:smn_codigo_descuento_rf}','form1');
document.form1.rcd_monto_descuento_ml.value='${fld:rcd_monto_descuento_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.rcd_monto_descuento_ma.value='${fld:rcd_monto_descuento_ma@#,###,##0.00}';
document.form1.id.value='${fld:smn_rel_cob_descuento_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


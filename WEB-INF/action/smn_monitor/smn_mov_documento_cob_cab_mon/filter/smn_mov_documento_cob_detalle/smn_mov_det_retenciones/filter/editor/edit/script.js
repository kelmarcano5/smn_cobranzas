document.form1.smn_mov_documento_cob_det_id.value='${fld:smn_mov_documento_cob_det_id@#,###,###}';
document.form1.smn_codigo_impuesto_id.value='${fld:smn_codigo_impuesto_id@#,###,###}';
document.form1.mdr_porcentaje.value='${fld:mdr_porcentaje@#,###,##0.00}';
document.form1.mdr_base.value='${fld:mdr_base@#,###,##0.00}';
document.form1.mdr_monto_retenciones_ml.value='${fld:mdr_monto_retenciones_ml@#,###,##0.00}';
document.form1.smn_moneda_rf.value='${fld:smn_moneda_rf@#,###,###}';
document.form1.smn_tasa_rf.value='${fld:smn_tasa_rf@#,###,###}';
document.form1.mdr_monto_retenciones_ma.value='${fld:mdr_monto_retenciones_ma@#,###,##0.00}';
document.form1.id.value='${fld:smn_mov_det_retenciones_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


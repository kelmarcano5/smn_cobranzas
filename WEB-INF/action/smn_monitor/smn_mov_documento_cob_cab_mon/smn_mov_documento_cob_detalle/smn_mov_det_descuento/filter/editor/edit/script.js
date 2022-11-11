document.form1.smn_mov_documento_cob_det_id_name.value='${fld:mdd_idioma_pl0@js}';
document.form1.smn_mov_documento_cob_det_id.value='${fld:smn_mov_documento_cob_det_id@#,###,###}';
document.form1.smn_codigo_descuento_id.value='${fld:smn_codigo_descuento_id@#,###,###}';
document.form1.mds_porcentaje.value='${fld:mds_porcentaje@#,###,##0.00}';
document.form1.mds_base.value='${fld:mds_base@#,###,##0.00}';
document.form1.mds_monto_descuento_ml.value='${fld:mds_monto_descuento_ml@#,###,##0.00}';
document.form1.smn_moneda_rf.value='${fld:smn_moneda_rf@#,###,###}';
document.form1.smn_tasa_rf.value='${fld:smn_tasa_rf@#,###,###}';
document.form1.mds_monto_descuento_ma.value='${fld:mds_monto_descuento_ma@#,###,##0.00}';
document.form1.id.value='${fld:smn_mov_det_descuento_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


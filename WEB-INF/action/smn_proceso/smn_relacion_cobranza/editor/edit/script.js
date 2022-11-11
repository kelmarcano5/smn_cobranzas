setComboValue('smn_modulo_rf','${fld:smn_modulo_rf}','form1');
setComboValue('smn_doc_orig_rf','${fld:smn_doc_orig_rf}','form1');
document.form1.smn_num_doc_orig.value='${fld:smn_num_doc_orig@#######}';
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.rco_numero_documento.value='${fld:rco_numero_documento@#######}';
setComboValue('smn_cliente_rf','${fld:smn_cliente_rf}','form1');
document.form1.rco_monto_bruto_cob_ml.value='${fld:rco_monto_bruto_cob_ml@######000}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.rco_monto_bruto_cob_ma.value='${fld:rco_monto_bruto_cob_ma@######000}';
document.form1.rco_monto_desc_ret_cob_ml.value='${fld:rco_monto_desc_ret_cob_ml@######000}';
document.form1.rco_monto_desc_ret_cob_ma.value='${fld:rco_monto_desc_ret_cob_ma@######000}';
document.form1.rco_monto_neto_cob_ml.value='${fld:rco_monto_neto_cob_ml@######000}';
document.form1.rco_monto_neto_cob_ma.value='${fld:rco_monto_neto_cob_ma@######000}';
setComboValue('rco_estatus_proceso','${fld:rco_estatus_proceso}','form1');
document.form1.id.value='${fld:smn_relacion_cobranza_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

<rows>selectSmnMovDocumentoCobDetId('${fld:smn_mov_documento_cob_det_id}','${fld:smn_tipo_documento_id}');</rows> 


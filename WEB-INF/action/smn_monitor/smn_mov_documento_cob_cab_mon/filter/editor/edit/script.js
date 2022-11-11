setComboValue('smn_modulo_origen_rf','${fld:smn_modulo_origen_rf}','form1');
setComboValue('smn_documento_rf','${fld:smn_documento_rf}','form1');
document.form1.mdc_numero_doc_origen.value='${fld:mdc_numero_doc_origen@#,###,###}';
setComboValue('smn_cliente_rf','${fld:smn_cliente_rf}','form1');
document.form1.mdc_fecha_documento.value='${fld:mdc_fecha_documento@dd-MM-yyyy}';
document.form1.mdc_fecha_vencimiento.value='${fld:mdc_fecha_vencimiento@dd-MM-yyyy}';
document.form1.mdc_monto_ml.value='${fld:mdc_monto_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.mdc_monto_ma.value='${fld:mdc_monto_ma@#,###,##0.00}';
document.form1.mdc_saldo_doc_ml.value='${fld:mdc_saldo_doc_ml@#,###,##0.00}';
document.form1.mdc_saldo_doc_ma.value='${fld:mdc_saldo_doc_ma@#,###,##0.00}';
setComboValue('mdc_estatus_proceso','${fld:mdc_estatus_proceso}','form1');
setComboValue('mdc_estatus_financiero','${fld:mdc_estatus_financiero}','form1');
document.form1.id.value='${fld:smn_mov_documento_cob_cab_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


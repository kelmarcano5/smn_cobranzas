setComboValue('smn_mov_documento_cob_cab_id','${fld:smn_mov_documento_cob_cab_id}','form1');
setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.mdd_numero_documento.value='${fld:mdd_numero_documento@#,###,###}';
document.form1.smn_cliente_rf.value='${fld:smn_cliente_rf@#,###,###}';
setComboValue('smn_centro_costo_rf','${fld:smn_centro_costo_rf}','form1');
document.form1.mdd_monto_ml.value='${fld:mdd_monto_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.mdd_monto_ma.value='${fld:mdd_monto_ma@#,###,##0.00}';
document.form1.mdd_fecha_pago.value='${fld:mdd_fecha_pago@dd-MM-yyyy}';
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.mdd_diferencia_cambiario.value='${fld:mdd_diferencia_cambiario@#,###,##0.00}';
document.form1.id.value='${fld:smn_mov_documento_cob_det_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


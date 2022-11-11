document.form1.smn_relacion_cobranza_id.value='${fld:smn_relacion_cobranza_id@#,###,###}';
$('#smn_codigos_impuestos_rf').val('${fld:smn_codigos_impuestos_rf}').trigger('change');
document.form1.rci_monto_base.value=formatear_monto('${fld:rci_monto_base@#,###,##0.00}');
document.form1.smn_porcentaje_impuesto_rf.value='${fld:smn_porcentaje_impuesto_rf@#,###,###}';
document.form1.rci_sustraendo_rf.value='${fld:rci_sustraendo_rf@#,###,##0.00}';
document.form1.rci_tipo_movimiento.value='${fld:rci_tipo_movimiento@js}';
document.form1.rci_tipo_movimiento_combo.value='${fld:rci_tipo_movimiento_combo@js}';
document.form1.rci_monto_impuesto_ml.value='${fld:rci_monto_impuesto_ml@#,###,##0.00}';
$('#smn_moneda').val('${fld:smn_moneda}').trigger('change');
$('#smn_tasa').val('${fld:smn_tasa}').trigger('change');
document.form1.rci_monto_impuesto_ma.value='${fld:rci_monto_impuesto_ma@#,###,##0.00}';
document.form1.id.value='${fld:smn_rel_cob_impuesto_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


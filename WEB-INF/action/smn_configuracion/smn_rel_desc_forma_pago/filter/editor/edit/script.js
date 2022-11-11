setComboValue('smn_descuentos_retenciones_rf','${fld:smn_descuentos_retenciones_rf}','form1');
setComboValue('smn_forma_pago_id','${fld:smn_forma_pago_id}','form1');
document.form1.rdf_estatus.value='${fld:rdf_estatus@js}';
document.form1.id.value='${fld:smn_rel_desc_forma_pago_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


 


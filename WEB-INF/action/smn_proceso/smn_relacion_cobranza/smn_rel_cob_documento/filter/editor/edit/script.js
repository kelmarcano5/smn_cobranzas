document.form1.smn_relacion_cobranza_id.value='${fld:smn_relacion_cobranza_id@#,###,###}';
setComboValue('smn_mov_documento_cob_det_id','${fld:smn_mov_documento_cob_det_id}','form1');
document.form1.id.value='${fld:smn_rel_cob_documento_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


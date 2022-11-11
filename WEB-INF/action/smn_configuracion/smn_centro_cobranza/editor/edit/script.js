document.form1.cco_codigo.value='${fld:cco_codigo@js}';
document.form1.cco_descripcion.value='${fld:cco_descripcion@js}';
setComboValue('smn_rol_id','${fld:smn_rol_id}','form1');
setComboValue('smn_auxiliar_id','${fld:smn_auxiliar_id}','form1');
document.form1.rol_estatus.value='${fld:rol_estatus@js}';
document.form1.id.value='${fld:smn_centro_cobranza_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.cco_codigo.disabled=true;
 


document.form1.cco_codigo.disabled=true;
 


document.form1.cco_codigo.disabled=true;
 


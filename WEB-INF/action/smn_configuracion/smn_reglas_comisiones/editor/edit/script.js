setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
document.form1.rco_porcentaje.value='${fld:rco_porcentaje@##,###,##00.00}';
setComboValue('rco_estatus','${fld:rco_estatus}','form1');
document.form1.rco_vigencia.value='${fld:rco_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_reglas_comisiones_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
<rows>selectSmnRolId('${fld:smn_rol_id}','${fld:smn_usuario_rf}');</rows> 



 


document.form1.tai_codigo.value='${fld:tai_codigo@js}';
document.form1.tai_descripcion.value='${fld:tai_descripcion@js}';
document.form1.tai_porcentaje.value='${fld:tai_porcentaje@#,###,##0.00}';
setComboValue('rol_estatus','${fld:rol_estatus}','form1');
document.form1.rol_vigencia.value='${fld:rol_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_tasas_de_interes_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.tai_codigo.disabled=true;
 


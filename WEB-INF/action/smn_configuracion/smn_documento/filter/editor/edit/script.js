setComboValue('smn_documento_general_rf','${fld:smn_documento_general_rf}','form1');
setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');
document.form1.doc_codigo.value='${fld:doc_codigo@js}';
document.form1.doc_descripcion.value='${fld:doc_descripcion@js}';
setComboValue('doc_afec_documento','${fld:doc_afec_documento}','form1');
setComboValue('doc_usa_moneda_alterna','${fld:doc_usa_moneda_alterna}','form1');
setComboValue('doc_multiples_pagador','${fld:doc_multiples_pagador}','form1');
setComboValue('doc_estatus','${fld:doc_estatus}','form1');
document.form1.doc_vigencia.value='${fld:doc_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_documento_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.doc_codigo.disabled=true;
 


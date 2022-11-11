var list = document.getElementById("detalle");
console.log(list);
//document.getElementById("smn_mov_documento_cob_cab_id").remove();



for(var i = (list.getElementsByTagName('input').length + list.getElementsByTagName('span').length + list.getElementsByTagName('br').length) - 1; 0 <= i; i--)
	
document.getElementById("smn_mov_documento_cob_cab_id").remove();

<smn_mov_documento_cob_cab_rows>;



var checkbox = document.createElement('input');
checkbox.type = "checkbox";
checkbox.name = "smn_mov_documento_cob_cab_id";
checkbox.id = "smn_mov_documento_cob_cab_id";
checkbox.type = "checkbox";
checkbox.checked = true;
checkbox.value = "${fld:smn_mov_documento_cob_cab_id}";
checkbox.style = "width: 10px";
checkbox.setAttribute("onclick","javascript:sumar('${fld:mdc_saldo_doc_ml}','${fld:mdc_saldo_doc_ma}',(this));");


var span = document.createElement('span');
span.id = "smn_mov_documento_cob_cab_id";
//span.appendChild(document.createTextNode(' ${fld:mdc_numero_doc_origen} | - | ${fld:mdc_saldo_doc_ml@#,###,##0.00} | - | ${fld:mdc_saldo_doc_ma@#,###,##0.00} '));
span.appendChild(document.createTextNode(' ${fld:mdc_numero_factura} | - | ${fld:mdc_saldo_doc_ml@#,###,##0.00} | - | ${fld:mdc_saldo_doc_ma@#,###,##0.00} '));

var br = document.createElement('br');
br.id = "smn_mov_documento_cob_cab_id";

	list.appendChild(checkbox);
	list.appendChild(span);
	list.appendChild(br);


</smn_mov_documento_cob_cab_rows>


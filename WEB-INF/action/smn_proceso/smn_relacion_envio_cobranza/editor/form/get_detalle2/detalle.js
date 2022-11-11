var list = document.getElementById("detalle");
//alert(list);
for(var i = (list.getElementsByTagName('input').length + list.getElementsByTagName('span').length + list.getElementsByTagName('br').length) - 1; 0 <= i; i--)
	document.getElementById("smn_mov_documento_cob_cab_id").remove();

<smn_mov_documento_cob_cab_rows>
setCheckboxValue('smn_mov_documento_cob_cab_id','${fld:smn_mov_documento_cob_cab_id}','form1');

var checkbox = document.createElement('input');
checkbox.type = "checkbox";
checkbox.name = "smn_mov_documento_cob_cab_id";
checkbox.id = "smn_mov_documento_cob_cab_id";
var marca = "${fld:marcado}";
if(marca=="true")
	checkbox.checked = true
else
	checkbox.checked = false;
//checkbox.checked = "${fld:marcado}";
checkbox.value = "${fld:smn_mov_documento_cob_cab_id}";
checkbox.style = "width: 10px";
checkbox.setAttribute("onclick","javascript:sumar('${fld:mdc_saldo_doc_ml}','${fld:mdc_saldo_doc_ma}',(this));");

var span = document.createElement('span')
span.id = "smn_mov_documento_cob_cab_id";
span.appendChild(document.createTextNode('${fld:mdc_numero_factura} | - | ${fld:mdc_saldo_doc_ml@######0.00} | - | ${fld:mdc_saldo_doc_ma@######0.00}'));

var br = document.createElement('br');
br.id = "smn_mov_documento_cob_cab_id";

detalle.appendChild(checkbox);
detalle.appendChild(span);
detalle.appendChild(br);

</smn_mov_documento_cob_cab_rows>






document.form1.id.value='${fld:smn_relacion_envio_cobranza_id@#,###,###}';
setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');

setComboValue('smn_cliente_rf','${fld:smn_cliente_rf}','form1');
document.form1.rec_fecha_generacion.value='${fld:rec_fecha_generacion@dd-MM-yyyy}';
document.form1.rec_fecha_entrega.value='${fld:rec_fecha_entrega@dd-MM-yyyy}';
document.form1.rec_ejecutivo_recibe.value='${fld:rec_ejecutivo_recibe@js}';
document.form1.rec_monto_ml.value='${fld:rec_monto_ml@###########0.00}';
document.form1.rec_monto_ma.value='${fld:rec_monto_ma@###########0.00}';
document.form1.rec_cantidad_documento.value='${fld:rec_cantidad_documento@######0}';
//document.form1.id.value='${fld:id}';
 


var list = document.getElementById("detalle");
document.getElementById("smn_mov_documento_cob_cab_id").remove();

for(var i = (list.getElementsByTagName('input').length + list.getElementsByTagName('span').length + list.getElementsByTagName('br').length) - 1; 0 <= i; i--)
	

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
span.appendChild(document.createTextNode(' ${fld:mdc_numero_doc_origen} | - | ${fld:mdc_saldo_doc_ml@###########0.00} | - | ${fld:mdc_saldo_doc_ma@###########0.00} '));

var br = document.createElement('br');
br.id = "smn_mov_documento_cob_cab_id";

list.appendChild(checkbox);
list.appendChild(span);
list.appendChild(br);

</smn_mov_documento_cob_cab_rows>;


document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1"); 







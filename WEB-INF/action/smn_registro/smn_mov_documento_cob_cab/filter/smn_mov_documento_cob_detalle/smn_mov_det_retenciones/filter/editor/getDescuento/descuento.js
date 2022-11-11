//listboxClear("smn_documento_id");

// var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
// optionChoose.value = "0";
// document.form1.smn_documento_id.add(optionChoose, 0);
var impuesto ='${fld:impuesto}';
var impuesto0= impuesto/100;
document.getElementById('mdr_porcentaje').value=impuesto;

//alert('${fld:base}');
var base = '${fld:base}';
var base0 = base /100; 
document.getElementById('mdr_base').value=base;
//alert('${fld:descporc}');
//alert('${fld:id3}');

var monto = '${fld:id3}';


var totl= parseFloat(monto) * parseFloat(base0) * parseFloat(impuesto0);

document.getElementById('mdr_monto_retenciones_ml').value = totl;
document.getElementById('mdr_monto_retenciones_ml').disabled=true;
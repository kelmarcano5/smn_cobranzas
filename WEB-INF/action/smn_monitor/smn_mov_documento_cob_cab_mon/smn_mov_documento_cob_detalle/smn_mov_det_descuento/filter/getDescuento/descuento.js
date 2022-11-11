//listboxClear("smn_documento_id");

// var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
// optionChoose.value = "0";
// document.form1.smn_documento_id.add(optionChoose, 0);
var descporc ='${fld:descporc}';
var descporc0= descporc/100;
document.getElementById('mds_porcentaje').value=descporc;

//alert('${fld:base}');
var base = '${fld:base}';
var base0 = base /100; 
document.getElementById('mds_base').value=base;
//alert('${fld:descporc}');
//alert('${fld:id3}');

var monto = '${fld:id3}';


var totl= parseFloat(monto) * parseFloat(base0) * parseFloat(descporc0);

document.getElementById('mds_monto_descuento_ml').value = totl;
document.getElementById('mds_monto_descuento_ml').disabled=true;

var totalsaldo = 0
var sald = document.getElementById("saldo_documento").value;
totalsaldo = (parseFloat(sald)-parseFloat(totl)).toFixed(3);
document.getElementById("mdd_saldo_ml").value = totalsaldo;
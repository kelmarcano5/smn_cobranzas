//listboxClear("smn_documento_id");

// var optionChoose = document.createElement("option");
// optionChoose.text = '[${lbl:b_choose}]';
// optionChoose.value = "0";
// document.form1.smn_documento_id.add(optionChoose, 0);
var tdc ='${fld:tasa}';
//alert('${fld:tasa}');
var monto = '${fld:id3}';
//alert('${fld:id3}');

var total= parseFloat(monto) / parseFloat(tdc);

document.getElementById('mds_monto_descuento_ma').value = total;
document.getElementById('mds_monto_descuento_ma').disabled=true;
var monto_impuesto_ml = $("#rci_monto_impuesto_ml").val();
var monto_cambio = '${fld:item}';
var total_impuesto_ma;

total_impuesto_ma = parseFloat(monto_impuesto_ml)/parseFloat(monto_cambio);

$("#rci_monto_impuesto_ma").val(total_impuesto_ma.toFixed(2));

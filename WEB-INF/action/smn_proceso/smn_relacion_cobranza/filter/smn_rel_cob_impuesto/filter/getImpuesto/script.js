var sus = '${fld:sustraendo}';
var por = '${fld:porcentaje}';
var porbase = '${fld:porcbase}';
var tipocod = "${fld:tipocod}";
var monto = formatear_monto($('#rci_monto_base').val());
var total;

if (sus=="") 
	sus=0;

$("#rci_sustraendo_rf").val(sus);
$("#smn_porcentaje_impuesto_rf").val(por);

total = (parseFloat(monto)*parseFloat(porbase))/100;
total = (total*parseFloat(por))/100;
total = parseFloat(total) - parseFloat(sus);

if(tipocod == 'RE')
{
	total = total*-1;
	$("#rci_tipo_movimiento_combo").val('${lbl:b_retention}');
}
else
{
	$("#rci_tipo_movimiento_combo").val('${lbl:b_added_value}');
}

$("#rci_tipo_movimiento").val(tipocod);
$("#rci_monto_impuesto_ml").val(total.toFixed(2));
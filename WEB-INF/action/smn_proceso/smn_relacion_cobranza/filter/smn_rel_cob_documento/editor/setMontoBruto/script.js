var mdd_saldo_ml           = "${fld:mdd_saldo_ml}";
var mdd_saldo_ma           = "${fld:mdd_saldo_ma}";
var rco_monto_bruto_cob_ml = "${fld:rco_monto_bruto_cob_ml}";
var rco_monto_bruto_cob_ma = "${fld:rco_monto_bruto_cob_ma}";
var rcd_monto_bruto_ml     = $("#rcd_monto_bruto_ml").val();
var rcd_monto_bruto_ma     = $("#rcd_monto_bruto_ma").val();
var monto_tasa_cambio      = "${fld:tca_tasa_cambio}";
var rco_monto_diferencial_cambiario;
var diferencial_ml;
var diferencial_ma;

if(mdd_saldo_ml=="")
	mdd_saldo_ml=0;

if(mdd_saldo_ma=="")
	mdd_saldo_ma=0;

if(rco_monto_bruto_cob_ml=="")
	rco_monto_bruto_cob_ml=0;

if(rco_monto_bruto_cob_ma=="")
	rco_monto_bruto_cob_ma=0;

if($("#check-${fld:id}").prop("checked"))
{
	rcd_monto_bruto_ml = parseFloat(rcd_monto_bruto_ml) + parseFloat(mdd_saldo_ml);
	rcd_monto_bruto_ma = parseFloat(rcd_monto_bruto_ma) + parseFloat(mdd_saldo_ma);
	if(!$("#check-${fld:id}").is(':disabled'))
		$("#check-${fld:id}").attr('name','smn_mov_documento_cob_cab_id');
}
else
{
	rcd_monto_bruto_ml = parseFloat(rcd_monto_bruto_ml) - parseFloat(mdd_saldo_ml);
	rcd_monto_bruto_ma = parseFloat(rcd_monto_bruto_ma) - parseFloat(mdd_saldo_ma);
	if(!$("#check-${fld:id}").is(':disabled'))
		$("#check-${fld:id}").attr('name','check-${fld:id}');
}

rco_monto_diferencial_cambiario = rco_monto_bruto_cob_ml-rcd_monto_bruto_ml;
diferencial_ml = rcd_monto_bruto_ml + rco_monto_diferencial_cambiario;
diferencial_ma = rcd_monto_bruto_ma - parseFloat(rco_monto_bruto_cob_ma);

$("#rcd_monto_bruto_ml").val(rcd_monto_bruto_ml);
$("#rcd_monto_bruto_ma").val(rcd_monto_bruto_ma);
$("#rco_monto_diferencial_cambiario").val(rco_monto_diferencial_cambiario);
$("#rco_diferencial_ml").val(diferencial_ml);
$("#rco_diferencial_ma").val(diferencial_ma);
UPDATE smn_cobranzas.smn_rel_cob_descuento SET
	rcd_monto_descuento_ml = ${fld:total_descuento_ml_redondeo},
	smn_moneda_rf = ${fld:smn_moneda_rf_detalle},
	rcd_monto_descuento_ma = ${fld:total_descuento_ma_redondeo},
	rcd_idioma = '${def:locale}',
	rcd_usuario = '${def:user}',
	rcd_fecha_registro = {d '${def:date}'},
	rcd_hora = '${def:time}'
WHERE
	smn_rel_cob_descuento_id = ${fld:smn_descuento_retencion_id}
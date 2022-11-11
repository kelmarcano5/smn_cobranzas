UPDATE smn_cobranzas.smn_rel_cob_descuento SET
	smn_relacion_cobranza_id=${fld:smn_relacion_cobranza_id},
	smn_codigo_descuento_rf=${fld:smn_codigo_descuento_rf},
	rcd_monto_descuento_ml=${fld:rcd_monto_descuento_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	rcd_monto_descuento_ma=${fld:rcd_monto_descuento_ma},
	rcd_idioma='${def:locale}',
	rcd_usuario='${def:user}',
	rcd_fecha_registro={d '${def:date}'},
	rcd_hora='${def:time}'

WHERE
	smn_rel_cob_descuento_id=${fld:id}


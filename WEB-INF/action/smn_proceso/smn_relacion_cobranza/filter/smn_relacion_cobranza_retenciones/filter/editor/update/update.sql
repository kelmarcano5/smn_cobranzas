UPDATE smn_cobranzas.smn_relacion_cobranza_retenciones SET
	smn_clave_aprobacion_pedido=${fld:smn_clave_aprobacion_pedido},
	smn_relacion_cobranza_id=${fld:smn_relacion_cobranza_id},
	smn_codigo_retenciones_rf=${fld:smn_codigo_retenciones_rf},
	rcr_monto_retenciones_ml=${fld:rcr_monto_retenciones_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	rcr_monto_retenciones_ma=${fld:rcr_monto_retenciones_ma},
	rcr_idioma='${def:locale}',
	rcr_usuario='${def:user}',
	rcr_fecha_registro={d '${def:date}'},
	rcr_hora='${def:time}'

WHERE
	smn_relacion_cobranza_retenciones_id=${fld:id}


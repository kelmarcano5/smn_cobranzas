UPDATE smn_cobranzas.smn_rel_cob_impuesto SET
	smn_relacion_cobranza_id=${fld:smn_relacion_cobranza_id},
	smn_codigos_impuestos_rf=${fld:smn_codigos_impuestos_rf},
	rci_monto_base=${fld:rci_monto_base},
	smn_porcentaje_impuesto_rf=${fld:smn_porcentaje_impuesto_rf},
	rci_sustraendo_rf=${fld:rci_sustraendo_rf},
	rci_tipo_movimiento=${fld:rci_tipo_movimiento},
	rci_monto_impuesto_ml=${fld:rci_monto_impuesto_ml},
	smn_moneda=${fld:smn_moneda},
	smn_tasa=${fld:smn_tasa},
	rci_monto_impuesto_ma=${fld:rci_monto_impuesto_ma},
	rci_idioma='${def:locale}',
	rci_usuario='${def:user}',
	rci_fecha_registro={d '${def:date}'},
	rci_hora='${def:time}'

WHERE
	smn_rel_cob_impuesto_id=${fld:id}


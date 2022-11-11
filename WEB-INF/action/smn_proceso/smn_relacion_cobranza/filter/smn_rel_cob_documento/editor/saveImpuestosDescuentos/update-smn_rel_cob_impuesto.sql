UPDATE smn_cobranzas.smn_rel_cob_impuesto SET
	rci_monto_base=${fld:subtotal_monto_neto_ml},
	smn_porcentaje_impuesto_rf=${fld:imp_porcentaje_calculo},
	rci_sustraendo_rf=${fld:imp_monto_sustraendo},
	rci_tipo_movimiento=${fld:imp_tipo_codigo},
	rci_monto_impuesto_ml=${fld:total_impuesto_ml_redondeo},
	smn_moneda=${fld:smn_moneda_rf_detalle},
	smn_tasa=${fld:smn_tasa_rf_detalle},
	rci_monto_impuesto_ma=${fld:total_impuesto_ma_redondeo},
	rci_idioma='${def:locale}',
	rci_usuario='${def:user}',
	rci_fecha_registro={d '${def:date}'},
	rci_hora='${def:time}'
WHERE
	smn_rel_cob_impuesto_id = ${fld:smn_mov_det_impuesto_id}
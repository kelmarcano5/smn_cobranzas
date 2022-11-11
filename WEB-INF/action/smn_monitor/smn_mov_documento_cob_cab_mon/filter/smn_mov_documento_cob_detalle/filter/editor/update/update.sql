UPDATE smn_cobranzas.smn_mov_documento_cob_detalle SET
	smn_mov_documento_cob_cab_id=${fld:smn_mov_documento_cob_cab_id},
	smn_tipo_documento_id=${fld:smn_tipo_documento_id},
	smn_documento_id=${fld:smn_documento_id},
	mdd_numero_documento=${fld:mdd_numero_documento},
	smn_cliente_rf=${fld:smn_cliente_rf},
	smn_centro_costo_rf=${fld:smn_centro_costo_rf},
	mdd_monto_ml=${fld:mdd_monto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	mdd_monto_ma=${fld:mdd_monto_ma},
	mdd_fecha_pago=${fld:mdd_fecha_pago},
	smn_tasa_rf=${fld:smn_tasa_rf},
	mdd_diferencia_cambiario=${fld:mdd_diferencia_cambiario},
	mdd_idioma='${def:locale}',
	mdd_usuario='${def:user}',
	mdd_fecha_registro={d '${def:date}'},
	mdd_hora='${def:time}'

WHERE
	smn_mov_documento_cob_det_id=${fld:id}


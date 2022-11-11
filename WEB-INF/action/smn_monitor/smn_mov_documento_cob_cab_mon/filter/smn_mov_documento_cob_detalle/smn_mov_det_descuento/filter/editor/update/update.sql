UPDATE smn_cobranzas.smn_mov_det_descuento SET
	smn_mov_documento_cob_det_id=${fld:smn_mov_documento_cob_det_id},
	smn_codigo_descuento_id=${fld:smn_codigo_descuento_id},
	mds_porcentaje=${fld:mds_porcentaje},
	mds_base=${fld:mds_base},
	mds_monto_descuento_ml=${fld:mds_monto_descuento_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	mds_monto_descuento_ma=${fld:mds_monto_descuento_ma},
	mds_idioma='${def:locale}',
	mds_usuario='${def:user}',
	mds_fecha_registro={d '${def:date}'},
	mds_hora='${def:time}'

WHERE
	smn_mov_det_descuento_id=${fld:id}


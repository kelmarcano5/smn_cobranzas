UPDATE smn_cobranzas.smn_mov_det_retenciones SET
	smn_mov_documento_cob_det_id=${fld:smn_mov_documento_cob_det_id},
	smn_codigo_impuesto_id=${fld:smn_codigo_impuesto_id},
	mdr_porcentaje=${fld:mdr_porcentaje},
	mdr_base=${fld:mdr_base},
	mdr_monto_retenciones_ml=${fld:mdr_monto_retenciones_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	mdr_monto_retenciones_ma=${fld:mdr_monto_retenciones_ma},
	mdr_idioma='${def:locale}',
	mdr_usuario='${def:user}',
	mdr_fecha_registro={d '${def:date}'},
	mdr_hora='${def:time}'

WHERE
	smn_mov_det_retenciones_id=${fld:id}


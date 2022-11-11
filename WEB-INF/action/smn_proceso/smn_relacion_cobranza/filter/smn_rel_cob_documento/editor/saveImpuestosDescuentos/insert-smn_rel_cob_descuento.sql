INSERT INTO smn_cobranzas.smn_rel_cob_descuento
(
	smn_rel_cob_descuento_id,
	smn_relacion_cobranza_id,
	smn_codigo_descuento_rf,
	rcd_monto_descuento_ml,
	smn_moneda_rf,
	rcd_monto_descuento_ma,
	rcd_idioma,
	rcd_usuario,
	rcd_fecha_registro,
	rcd_hora
)
VALUES
(
	nextval('smn_cobranzas.seq_smn_rel_cob_descuento'),
	${fld:smn_relacion_cobranza_id},
	${fld:smn_descuentos_retenciones_id},
	${fld:total_descuento_ml_redondeo},
	${fld:smn_moneda_rf_detalle},
	${fld:total_descuento_ma_redondeo},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

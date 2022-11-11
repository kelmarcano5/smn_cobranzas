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
	${seq:currval@smn_cobranzas.seq_smn_rel_cob_descuento},
	${fld:smn_relacion_cobranza_id},
	${fld:smn_codigo_descuento_rf},
	${fld:rcd_monto_descuento_ml},
	${fld:smn_moneda_rf},
	${fld:rcd_monto_descuento_ma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

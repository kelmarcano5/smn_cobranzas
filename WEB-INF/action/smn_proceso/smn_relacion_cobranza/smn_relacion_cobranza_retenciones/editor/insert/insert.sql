INSERT INTO smn_cobranzas.smn_relacion_cobranza_retenciones
(
	smn_relacion_cobranza_retenciones_id,
	smn_clave_aprobacion_pedido,
	smn_relacion_cobranza_id,
	smn_codigo_retenciones_rf,
	rcr_monto_retenciones_ml,
	smn_moneda_rf,
	rcr_monto_retenciones_ma,
	rcr_idioma,
	rcr_usuario,
	rcr_fecha_registro,
	rcr_hora
)
VALUES
(
	${seq:currval@smn_cobranzas.seq_smn_relacion_cobranza_retenciones},
	${fld:smn_clave_aprobacion_pedido},
	${fld:smn_relacion_cobranza_id},
	${fld:smn_codigo_retenciones_rf},
	${fld:rcr_monto_retenciones_ml},
	${fld:smn_moneda_rf},
	${fld:rcr_monto_retenciones_ma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

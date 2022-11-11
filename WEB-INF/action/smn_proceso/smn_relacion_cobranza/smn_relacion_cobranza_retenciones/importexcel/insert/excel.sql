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
	${seq:nextval@smn_cobranzas.seq_smn_relacion_cobranza_retenciones},
	?,
	?,
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

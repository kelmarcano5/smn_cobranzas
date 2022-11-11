INSERT INTO smn_cobranzas.smn_rel_cob_descuento
(
	smn_rel_cob_descuento_id,
	smn_relacion_cobranza_id,
	smn_codigo_descuento_rf,
	rcd_monto_descuento_ml,
	smn_moneda_rf,
	rcd_monto_descuento_ma,
	rcd_fecha_registro
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_rel_cob_descuento},
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)

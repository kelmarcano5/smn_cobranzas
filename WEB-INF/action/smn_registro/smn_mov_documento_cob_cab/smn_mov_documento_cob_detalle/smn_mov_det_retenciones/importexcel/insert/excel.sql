INSERT INTO smn_cobranzas.smn_mov_det_retenciones
(
	smn_mov_det_retenciones_id,
	smn_mov_documento_cob_det_id,
	smn_codigo_impuesto_id,
	mdr_porcentaje,
	mdr_base,
	mdr_monto_retenciones_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	mdr_monto_retenciones_ma,
	mdr_fecha_registro
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_mov_det_retenciones},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)

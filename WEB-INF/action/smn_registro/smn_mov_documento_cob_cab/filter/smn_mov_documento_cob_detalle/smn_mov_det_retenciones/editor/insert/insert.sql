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
	mdr_idioma,
	mdr_usuario,
	mdr_fecha_registro,
	mdr_hora
)
VALUES
(
	${seq:currval@smn_cobranzas.seq_smn_mov_det_retenciones},
	${fld:smn_mov_documento_cob_det_id},
	${fld:smn_codigo_impuesto_id},
	${fld:mdr_porcentaje},
	${fld:mdr_base},
	${fld:mdr_monto_retenciones_ml},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:mdr_monto_retenciones_ma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

UPDATE smn_cobranzas.smn_mov_documento_cob_detalle SET 
	mdd_saldo_ml = ${fld:mdd_saldo_ml}
WHERE
	smn_mov_documento_cob_det_id = ${fld:smn_mov_documento_cob_det_id}

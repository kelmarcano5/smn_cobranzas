INSERT INTO smn_cobranzas.smn_mov_det_descuento
(
	smn_mov_det_descuento_id,
	smn_mov_documento_cob_det_id,
	smn_codigo_descuento_id,
	mds_porcentaje,
	mds_base,
	mds_monto_descuento_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	mds_monto_descuento_ma,
	mds_idioma,
	mds_usuario,
	mds_fecha_registro,
	mds_hora
)
VALUES
(
	${seq:currval@smn_cobranzas.seq_smn_mov_det_descuento},
	${fld:smn_mov_documento_cob_det_id},
	${fld:smn_codigo_descuento_id},
	${fld:mds_porcentaje},
	${fld:mds_base},
	${fld:mds_monto_descuento_ml},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:mds_monto_descuento_ma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);


UPDATE smn_cobranzas.smn_mov_documento_cob_detalle SET
	mdd_saldo_ml = ${fld:mdd_saldo_ml}
WHERE
	smn_mov_documento_cob_det_id=${fld:smn_mov_documento_cob_det_id};

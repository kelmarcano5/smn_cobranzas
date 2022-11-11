SELECT
	smn_cobranzas.smn_tipo_documento.tdo_tipo_movimiento,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_monto_ml,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_monto_ma,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_saldo_doc_ml,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_saldo_doc_ma
FROM
	smn_cobranzas.smn_mov_documento_cob_detalle
	INNER JOIN
	smn_cobranzas.smn_mov_documento_cob_cab ON smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id
	INNER JOIN
	smn_cobranzas.smn_tipo_documento ON smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_tipo_documento_id
WHERE
	smn_mov_documento_cob_det_id=${fld:id}
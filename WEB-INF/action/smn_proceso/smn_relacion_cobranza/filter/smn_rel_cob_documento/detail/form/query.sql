SELECT
	smn_cobranzas.smn_documento.doc_codigo ||' - '|| smn_cobranzas.smn_documento.doc_descripcion AS smn_documento_id_combo,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_numero_documento,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_saldo_ml,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_fecha_registro
FROM
	smn_cobranzas.smn_rel_cob_documento
INNER JOIN
	smn_cobranzas.smn_mov_documento_cob_detalle ON smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id = smn_cobranzas.smn_rel_cob_documento.smn_mov_documento_cob_det_id
INNER JOIN
	smn_cobranzas.smn_relacion_cobranza ON smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id = smn_cobranzas.smn_rel_cob_documento.smn_relacion_cobranza_id
INNER JOIN
	smn_cobranzas.smn_documento ON smn_cobranzas.smn_documento.smn_documento_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_documento_id
where
	smn_cobranzas.smn_rel_cob_documento.smn_rel_cob_documento_id = ${fld:id}

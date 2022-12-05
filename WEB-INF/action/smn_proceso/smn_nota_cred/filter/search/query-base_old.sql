SELECT 
	smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_saldo_doc_ml,
    smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id,
    smn_cobranzas.smn_mov_documento_cob_detalle.smn_cliente_rf,
    smn_cobranzas.smn_mov_documento_cob_detalle.smn_documento_id,
    smn_cobranzas.smn_mov_documento_cob_detalle.smn_tipo_documento_id,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_numero_documento,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_monto_ml,
    smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion AS smn_cliente_rf_combo,
    smn_cobranzas.smn_documento.doc_codigo ||' - '|| smn_cobranzas.smn_documento.doc_descripcion AS smn_documento_id_combo,
    smn_cobranzas.smn_tipo_documento.tdo_codigo ||' - '|| smn_cobranzas.smn_tipo_documento.tdo_descripcion AS smn_tipo_documento_id_combo,
   	CASE
        WHEN smn_cobranzas.smn_mov_documento_cob_detalle.mdd_estatus='RE' THEN '${lbl:b_register}'
        WHEN smn_cobranzas.smn_mov_documento_cob_detalle.mdd_estatus='PE' THEN '${lbl:b_pending}'
        WHEN smn_cobranzas.smn_mov_documento_cob_detalle.mdd_estatus='AP' THEN '${lbl:b_approved}'
    END AS mdd_estatus,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_fecha_registro
FROM 
    smn_cobranzas.smn_mov_documento_cob_detalle
    INNER JOIN smn_cobranzas.smn_mov_documento_cob_cab ON smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id
    INNER JOIN smn_cobranzas.smn_tipo_documento ON smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_tipo_documento_id
    INNER JOIN smn_cobranzas.smn_documento ON smn_cobranzas.smn_documento.smn_documento_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_documento_id
    INNER JOIN smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_cliente_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_cliente_rf
    INNER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
WHERE
	smn_cobranzas.smn_tipo_documento.tdo_tipo_movimiento='NC'
	AND
	smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id is not null
	${filter}

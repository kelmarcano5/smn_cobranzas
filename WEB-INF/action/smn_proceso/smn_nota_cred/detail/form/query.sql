SELECT 	
    smn_cobranzas.smn_mov_documento_cob_detalle.*,
    smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion AS smn_cliente_rf_combo,
    smn_cobranzas.smn_documento.doc_codigo ||' - '|| smn_cobranzas.smn_documento.doc_descripcion AS smn_documento_id_combo,
    smn_cobranzas.smn_tipo_documento.tdo_codigo ||' - '|| smn_cobranzas.smn_tipo_documento.tdo_descripcion AS smn_tipo_documento_id_combo,
    smn_base.smn_centro_costo.cco_codigo ||' - '|| smn_base.smn_centro_costo.cco_descripcion_corta AS smn_centro_costo_rf_combo,
    smn_base.smn_tasas_de_cambio.tca_fecha_vigencia ||' -> '|| smn_base.smn_tasas_de_cambio.tca_tasa_cambio AS smn_tasa_rf_combo,
    smn_base.smn_monedas.mon_codigo ||' - '|| smn_base.smn_monedas.mon_nombre AS smn_moneda_rf_combo,
    CASE
        WHEN smn_cobranzas.smn_mov_documento_cob_detalle.mdd_estatus='PE' THEN '${lbl:b_pending}'
        WHEN smn_cobranzas.smn_mov_documento_cob_detalle.mdd_estatus='AP' THEN '${lbl:b_approved}'
    END AS mdd_estatus_combo
FROM 
    smn_cobranzas.smn_mov_documento_cob_detalle
    INNER JOIN smn_cobranzas.smn_mov_documento_cob_cab ON smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id
    INNER JOIN smn_cobranzas.smn_tipo_documento ON smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_tipo_documento_id
    INNER JOIN smn_cobranzas.smn_documento ON smn_cobranzas.smn_documento.smn_documento_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_documento_id
    INNER JOIN smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_cliente_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_cliente_rf
    INNER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
    LEFT OUTER JOIN smn_base.smn_centro_costo ON smn_base.smn_centro_costo.smn_centro_costo_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_centro_costo_rf
    LEFT OUTER JOIN smn_base.smn_monedas ON smn_base.smn_monedas.smn_monedas_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_moneda_rf
    LEFT OUTER JOIN smn_base.smn_tasas_de_cambio ON smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_tasa_rf
WHERE
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id=${fld:id}
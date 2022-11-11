SELECT 
    smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id,
    smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id AS smn_mov_documento_cob_cab_id,
    smn_cobranzas.smn_tipo_documento.tdo_descripcion AS smn_tipo_documento_id,
    smn_cobranzas.smn_documento.doc_descripcion AS smn_documento_id,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_numero_documento,
    smn_base.smn_auxiliar.aux_descripcion as smn_cliente_rf,
    smn_base.smn_centro_costo.cco_descripcion_corta as smn_centro_costo_rf,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_monto_ml,
    smn_base.smn_monedas.mon_nombre AS smn_moneda_rf,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_monto_ma,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_fecha_pago,
    smn_monedasA1.mon_nombre ||' - '|| smn_monedasA2.mon_nombre ||' - '|| smn_tasas_de_cambio.tca_fecha_vigencia ||' - '|| smn_tasas_de_cambio.tca_tasa_cambio AS smn_tasa_rf,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_diferencia_cambiario,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_fecha_registro

FROM 
    smn_cobranzas.smn_mov_documento_cob_detalle
    INNER JOIN smn_cobranzas.smn_mov_documento_cob_cab ON smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id
    INNER JOIN smn_cobranzas.smn_tipo_documento ON smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_tipo_documento_id
    INNER JOIN smn_cobranzas.smn_documento ON smn_cobranzas.smn_documento.smn_documento_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_documento_id
    INNER JOIN smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_cliente_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_cliente_rf
    INNER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
    LEFT OUTER JOIN smn_base.smn_centro_costo ON smn_base.smn_centro_costo.smn_centro_costo_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_centro_costo_rf
    LEFT OUTER JOIN smn_base.smn_monedas ON smn_base.smn_monedas.smn_monedas_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_moneda_rf
    LEFT OUTER JOIN smn_base.smn_tasas_de_cambio ON smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_tasa_rf
    LEFT OUTER JOIN smn_base.smn_monedas AS smn_monedasA1 ON smn_monedasA1.smn_monedas_id = smn_base.smn_tasas_de_cambio.smn_monedas_id
    LEFT OUTER JOIN smn_base.smn_monedas AS smn_monedasA2 ON smn_monedasA2.smn_monedas_id = smn_base.smn_tasas_de_cambio.tca_moneda_referencia
where
	smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id and
	smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_tipo_documento_id and
	smn_cobranzas.smn_documento.smn_documento_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_documento_id
	and
	smn_mov_documento_cob_det_id = ${fld:id}
    

SELECT 
	smn_cobranzas.smn_mov_det_descuento.smn_mov_det_descuento_id,
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id AS smn_mov_documento_cob_det_id,
	smn_descuentos_retenciones1.dyr_descripcion AS smn_codigo_descuento_id,
	smn_cobranzas.smn_mov_det_descuento.mds_porcentaje,
	smn_cobranzas.smn_mov_det_descuento.mds_base,
	smn_cobranzas.smn_mov_det_descuento.mds_monto_descuento_ml,
	smn_base.smn_monedas.mon_nombre AS smn_moneda_rf,
	smn_monedasA1.mon_nombre ||' - '|| smn_monedasA2.mon_nombre ||' - '|| smn_tasas_de_cambio.tca_fecha_vigencia ||' - '|| smn_tasas_de_cambio.tca_tasa_cambio AS smn_tasa_rf,
	smn_cobranzas.smn_mov_det_descuento.mds_monto_descuento_ma,
	smn_cobranzas.smn_mov_det_descuento.mds_fecha_registro
	
FROM 
	smn_cobranzas.smn_mov_det_descuento
	INNER JOIN smn_cobranzas.smn_mov_documento_cob_detalle ON smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id = smn_cobranzas.smn_mov_det_descuento.smn_mov_documento_cob_det_id
	LEFT OUTER JOIN smn_base.smn_descuentos_retenciones AS smn_descuentos_retenciones1 ON smn_descuentos_retenciones1.smn_descuentos_retenciones_id = smn_cobranzas.smn_mov_det_descuento.smn_codigo_descuento_id
	LEFT OUTER JOIN smn_base.smn_monedas ON smn_base.smn_monedas.smn_monedas_id = smn_cobranzas.smn_mov_det_descuento.smn_moneda_rf
	LEFT OUTER JOIN smn_base.smn_tasas_de_cambio ON smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_cobranzas.smn_mov_det_descuento.smn_tasa_rf
	LEFT OUTER JOIN smn_base.smn_monedas AS smn_monedasA1 ON smn_monedasA1.smn_monedas_id = smn_base.smn_tasas_de_cambio.smn_monedas_id
	LEFT OUTER JOIN smn_base.smn_monedas AS smn_monedasA2 ON smn_monedasA2.smn_monedas_id = smn_base.smn_tasas_de_cambio.tca_moneda_referencia
WHERE 
	smn_cobranzas.smn_mov_det_descuento.smn_mov_documento_cob_det_id = ${fld:id2}
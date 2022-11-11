SELECT
	smn_cobranzas.smn_mov_det_retenciones.smn_mov_det_retenciones_id,
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id AS smn_mov_documento_cob_det_id,
	smn_base.smn_codigos_impuestos.imp_descripcion AS smn_codigo_impuesto_id,
	smn_cobranzas.smn_mov_det_retenciones.mdr_porcentaje,
	smn_cobranzas.smn_mov_det_retenciones.mdr_base,
	smn_cobranzas.smn_mov_det_retenciones.mdr_monto_retenciones_ml,
	smn_base.smn_monedas.mon_nombre AS smn_moneda_rf,
	smn_monedasA1.mon_nombre ||' - '|| smn_monedasA2.mon_nombre ||' - '|| smn_tasas_de_cambio.tca_fecha_vigencia ||' - '|| smn_tasas_de_cambio.tca_tasa_cambio AS smn_tasa_rf,
	smn_cobranzas.smn_mov_det_retenciones.mdr_monto_retenciones_ma,
	smn_cobranzas.smn_mov_det_retenciones.mdr_fecha_registro
FROM
	smn_cobranzas.smn_mov_det_retenciones
	INNER JOIN smn_cobranzas.smn_mov_documento_cob_detalle ON smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id = smn_cobranzas.smn_mov_det_retenciones.smn_mov_documento_cob_det_id
	LEFT OUTER JOIN smn_base.smn_codigos_impuestos ON smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id = smn_cobranzas.smn_mov_det_retenciones.smn_codigo_impuesto_id
	LEFT OUTER JOIN smn_base.smn_monedas ON smn_base.smn_monedas.smn_monedas_id = smn_cobranzas.smn_mov_det_retenciones.smn_moneda_rf
	LEFT OUTER JOIN smn_base.smn_tasas_de_cambio ON smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_cobranzas.smn_mov_det_retenciones.smn_tasa_rf
	LEFT OUTER JOIN smn_base.smn_monedas AS smn_monedasA1 ON smn_monedasA1.smn_monedas_id = smn_base.smn_tasas_de_cambio.smn_monedas_id
	LEFT OUTER JOIN smn_base.smn_monedas AS smn_monedasA2 ON smn_monedasA2.smn_monedas_id = smn_base.smn_tasas_de_cambio.tca_moneda_referencia
WHERE
	smn_cobranzas.smn_mov_det_retenciones.smn_mov_documento_cob_det_id = ${fld:id2}

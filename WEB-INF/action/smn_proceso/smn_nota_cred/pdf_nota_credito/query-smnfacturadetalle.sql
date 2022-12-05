select DISTINCT
	smn_comercial.smn_factura_impresion_detalle.smn_grupo_titulo_impresion_rf as titulo_id,
    smn_comercial.smn_factura_impresion_detalle.fim_codigo,
	smn_comercial.smn_factura_impresion_detalle.fim_descripcion,
	smn_comercial.smn_factura_impresion_detalle.fim_monto_ml,
	smn_comercial.smn_factura_impresion_detalle.fim_monto_ma,
	smn_comercial.smn_factura_impresion_detalle.fim_cantidad
FROM
	smn_cobranzas.smn_mov_documento_cob_detalle
		INNER JOIN smn_cobranzas.smn_mov_documento_cob_cab ON 
		smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id = smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id
		
		INNER JOIN smn_comercial.smn_factura_cabecera ON 
		smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_factura = smn_comercial.smn_factura_cabecera.fca_numero_documento
		
		INNER JOIN smn_comercial.smn_factura_impresion_detalle ON 
		smn_comercial.smn_factura_cabecera.smn_pedido_original = smn_comercial.smn_factura_impresion_detalle.smn_pedido_cabecera_id
		and smn_comercial.smn_factura_cabecera.fca_fecha_registro= smn_comercial.smn_factura_impresion_detalle.fim_fecha_registro		

WHERE
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id= ${fld:smn_mov_documento_cob_det_id}

	-- smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_factura = ${fld:mdc_numero_factura}



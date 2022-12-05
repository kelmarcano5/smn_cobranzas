SELECT DISTINCT
	smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id,
	smn_base.smn_grupo_titulo_impresion.gti_descripcion AS grupo_titulo,
	smn_base.smn_grupo_titulo_impresion.gti_orden	
FROM
		smn_cobranzas.smn_mov_documento_cob_detalle
		INNER JOIN smn_cobranzas.smn_mov_documento_cob_cab ON 
		smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id = smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id
		
		INNER JOIN smn_comercial.smn_factura_cabecera ON 
		smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_factura = smn_comercial.smn_factura_cabecera.fca_numero_documento
		
		INNER JOIN smn_comercial.smn_factura_impresion_detalle ON 
		smn_comercial.smn_factura_cabecera.smn_pedido_original = smn_comercial.smn_factura_impresion_detalle.smn_pedido_cabecera_id

		INNER JOIN smn_base.smn_grupo_titulo_impresion ON 
		smn_comercial.smn_factura_impresion_detalle.smn_grupo_titulo_impresion_rf = smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id

WHERE
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id=${fld:smn_mov_documento_cob_det_id} 
	
GROUP BY smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id,
	smn_base.smn_grupo_titulo_impresion.gti_descripcion, smn_base.smn_grupo_titulo_impresion.gti_orden
ORDER BY smn_base.smn_grupo_titulo_impresion.gti_orden ASC


 
SELECT DISTINCT
	smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id,
	smn_base.smn_grupo_titulo_impresion.gti_descripcion AS grupo_titulo,
	smn_base.smn_grupo_titulo_impresion.gti_orden	
FROM
	smn_comercial.smn_pedido_cabecera
	INNER JOIN smn_comercial.smn_factura_impresion_detalle ON smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_factura_impresion_detalle.smn_pedido_cabecera_id
	INNER JOIN smn_base.smn_grupo_titulo_impresion ON smn_comercial.smn_factura_impresion_detalle.smn_grupo_titulo_impresion_rf = smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id
	LEFT JOIN smn_comercial.smn_rel_pedido_factura ON smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
	LEFT JOIN smn_comercial.smn_factura_cabecera ON smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id = smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id 
WHERE
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = ${fld:id}
GROUP BY smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id,
	smn_base.smn_grupo_titulo_impresion.gti_descripcion, smn_base.smn_grupo_titulo_impresion.gti_orden
ORDER BY smn_base.smn_grupo_titulo_impresion.gti_orden ASC
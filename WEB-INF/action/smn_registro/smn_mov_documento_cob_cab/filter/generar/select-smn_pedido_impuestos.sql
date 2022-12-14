SELECT
	SUM(pim_monto_impuesto) AS total_monto_impuesto_ml,
	SUM(pim_monto_impuesto_ma) AS total_monto_impuesto_ma
FROM
	smn_comercial.smn_pedido_impuestos
	INNER JOIN
	smn_comercial.smn_pedido_detalle ON smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=smn_comercial.smn_pedido_impuestos.smn_pedido_detalle_id
	INNER JOIN
	smn_comercial.smn_pedido_cabecera ON smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
WHERE
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido=${fld:mdc_numero_doc_origen}
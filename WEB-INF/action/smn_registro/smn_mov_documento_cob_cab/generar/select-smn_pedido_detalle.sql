SELECT
	smn_pedido_detalle_id,
	smn_servicios_rf,
	smn_item_rf
FROM
	smn_comercial.smn_pedido_detalle
WHERE
	smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}
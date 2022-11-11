SELECT 
	smn_pedido_cabecera_id 
FROM 
	smn_comercial.smn_pedido_cabecera 
WHERE 
	pca_numero_pedido=${fld:mdc_numero_doc_origen}
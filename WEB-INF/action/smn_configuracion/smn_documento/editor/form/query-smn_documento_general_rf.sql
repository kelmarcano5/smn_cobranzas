SELECT
	smn_base.smn_documentos_generales.smn_documentos_generales_id AS ID,
	smn_base.smn_documentos_generales.dcg_codigo ||' - '|| smn_base.smn_documentos_generales.dcg_descripcion AS item_prueba_de_dinamico 
FROM
	smn_base.smn_documentos_generales 
ORDER BY
ID ASC
SELECT
	smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id AS ID,
	smn_cobranzas.smn_tipo_documento.tdo_codigo ||' - '|| smn_cobranzas.smn_tipo_documento.tdo_descripcion AS item 
FROM
	smn_cobranzas.smn_tipo_documento 
ORDER BY
ID ASC
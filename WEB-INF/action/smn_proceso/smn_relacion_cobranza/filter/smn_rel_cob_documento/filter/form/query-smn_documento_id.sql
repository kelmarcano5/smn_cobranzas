SELECT
	smn_cobranzas.smn_documento.smn_documento_id AS id,
	smn_cobranzas.smn_documento.doc_codigo ||' - '|| smn_cobranzas.smn_documento.doc_descripcion AS item
FROM
	smn_cobranzas.smn_documento


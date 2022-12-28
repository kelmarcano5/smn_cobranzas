SELECT
	smn_cobranzas.smn_documento.doc_modulo_control_fiscal
FROM
	smn_cobranzas.smn_documento
WHERE smn_documento_id='${fld:doc_id}'
select 
	smn_cobranzas.smn_documento.smn_documento_id as id, 
	smn_cobranzas.smn_documento.doc_descripcion as item 
from 
	smn_cobranzas.smn_documento
WHERE
	smn_cobranzas.smn_documento.smn_tipo_documento_id=${fld:smn_tipo_documento_id}
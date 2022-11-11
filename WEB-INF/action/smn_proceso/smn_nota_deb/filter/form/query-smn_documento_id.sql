select 
	smn_cobranzas.smn_documento.smn_documento_id as id, 
	smn_cobranzas.smn_documento.doc_codigo || ' - ' || smn_cobranzas.smn_documento.doc_descripcion as item 
from 
	smn_cobranzas.smn_documento 
INNER JOIN 
	smn_cobranzas.smn_tipo_documento ON smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id=smn_cobranzas.smn_documento.smn_tipo_documento_id
WHERE
	smn_cobranzas.smn_tipo_documento.tdo_tipo_movimiento='ND'
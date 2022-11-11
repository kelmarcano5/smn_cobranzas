select
		smn_cobranzas.smn_documento.smn_documento_id,
	${field}
from
	smn_cobranzas.smn_documento
where
		smn_cobranzas.smn_documento.smn_documento_id is not null
	${filter}
	
	

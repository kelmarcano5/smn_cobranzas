select
		smn_cobranzas.smn_documento.doc_codigo
from
		smn_cobranzas.smn_documento
where
		upper(smn_cobranzas.smn_documento.doc_codigo) = upper(${fld:doc_codigo})

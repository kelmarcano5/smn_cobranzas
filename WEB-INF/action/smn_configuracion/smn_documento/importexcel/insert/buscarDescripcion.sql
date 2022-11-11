select
		smn_cobranzas.smn_documento.doc_descripcion
from
		smn_cobranzas.smn_documento
where
		upper(smn_cobranzas.smn_documento.doc_descripcion) = upper(${fld:doc_descripcion})

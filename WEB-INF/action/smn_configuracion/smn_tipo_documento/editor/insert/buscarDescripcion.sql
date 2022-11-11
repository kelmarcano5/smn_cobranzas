select
		smn_cobranzas.smn_tipo_documento.tdo_descripcion
from
		smn_cobranzas.smn_tipo_documento
where
		upper(smn_cobranzas.smn_tipo_documento.tdo_descripcion) = upper(${fld:tdo_descripcion})

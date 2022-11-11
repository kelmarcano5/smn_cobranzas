select
		smn_cobranzas.smn_tipo_documento.tdo_codigo
from
		smn_cobranzas.smn_tipo_documento
where
		upper(smn_cobranzas.smn_tipo_documento.tdo_codigo) = upper(${fld:tdo_codigo})

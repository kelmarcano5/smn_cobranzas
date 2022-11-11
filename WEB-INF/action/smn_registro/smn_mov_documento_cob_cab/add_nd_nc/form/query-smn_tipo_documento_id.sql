select 
	smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id as id, 
	smn_cobranzas.smn_tipo_documento.tdo_descripcion as item 
from 
	smn_cobranzas.smn_tipo_documento
WHERE
	smn_cobranzas.smn_tipo_documento.tdo_tipo_movimiento IN ('ND','NC')
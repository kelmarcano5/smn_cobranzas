select
		smn_cobranzas.smn_centro_cobranza.cco_descripcion
from
		smn_cobranzas.smn_centro_cobranza
where
		upper(smn_cobranzas.smn_centro_cobranza.cco_descripcion) = upper(${fld:cco_descripcion})

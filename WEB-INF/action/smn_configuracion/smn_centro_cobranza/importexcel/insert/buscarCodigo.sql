select
		smn_cobranzas.smn_centro_cobranza.cco_codigo
from
		smn_cobranzas.smn_centro_cobranza
where
		upper(smn_cobranzas.smn_centro_cobranza.cco_codigo) = upper(${fld:cco_codigo})

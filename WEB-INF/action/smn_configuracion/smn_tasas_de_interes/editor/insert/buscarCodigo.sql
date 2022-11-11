select
		smn_cobranzas.smn_tasas_de_interes.tai_codigo
from
		smn_cobranzas.smn_tasas_de_interes
where
		upper(smn_cobranzas.smn_tasas_de_interes.tai_codigo) = upper(${fld:tai_codigo})

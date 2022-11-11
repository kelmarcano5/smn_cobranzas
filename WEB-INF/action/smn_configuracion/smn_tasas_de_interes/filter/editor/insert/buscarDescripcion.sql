select
		smn_cobranzas.smn_tasas_de_interes.tai_descripcion
from
		smn_cobranzas.smn_tasas_de_interes
where
		upper(smn_cobranzas.smn_tasas_de_interes.tai_descripcion) = upper(${fld:tai_descripcion})

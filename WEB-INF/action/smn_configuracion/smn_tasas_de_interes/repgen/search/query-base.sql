select
		smn_cobranzas.smn_tasas_de_interes.smn_tasas_de_interes_id,
	${field}
from
	smn_cobranzas.smn_tasas_de_interes
where
		smn_cobranzas.smn_tasas_de_interes.smn_tasas_de_interes_id is not null
	${filter}
	
	

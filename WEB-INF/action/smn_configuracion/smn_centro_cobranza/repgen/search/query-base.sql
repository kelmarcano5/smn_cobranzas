select
		smn_cobranzas.smn_centro_cobranza.smn_centro_cobranza_id,
	${field}
from
	smn_cobranzas.smn_centro_cobranza
where
		smn_cobranzas.smn_centro_cobranza.smn_centro_cobranza_id is not null
	${filter}
	
	

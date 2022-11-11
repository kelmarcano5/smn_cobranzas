select
		smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id,
	${field}
from
	smn_cobranzas.smn_relacion_cobranza
where
		smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id is not null
	${filter}
	
	

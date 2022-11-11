select
		smn_cobranzas.smn_relacion_envio_cobranza.smn_relacion_envio_cobranza_id,
	${field}
from
	smn_cobranzas.smn_relacion_envio_cobranza
where
		smn_cobranzas.smn_relacion_envio_cobranza.smn_relacion_envio_cobranza_id is not null
	${filter}
	
	

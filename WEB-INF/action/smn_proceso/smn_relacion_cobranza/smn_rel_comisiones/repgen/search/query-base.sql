select
		smn_cobranzas.smn_rel_comisiones.smn_rel_comisiones_id,
	${field}
from
	smn_cobranzas.smn_rel_comisiones
where
		smn_cobranzas.smn_rel_comisiones.smn_rel_comisiones_id is not null
	${filter}
	
	

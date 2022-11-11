select
		smn_cobranzas.smn_rel_cob_descuento.smn_rel_cob_descuento_id,
	${field}
from
	smn_cobranzas.smn_rel_cob_descuento
where
		smn_cobranzas.smn_rel_cob_descuento.smn_rel_cob_descuento_id is not null
	${filter}
	
	

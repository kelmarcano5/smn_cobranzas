select
		smn_cobranzas.smn_rel_desc_forma_pago.smn_rel_desc_forma_pago_id,
	${field}
from
	smn_cobranzas.smn_rel_desc_forma_pago
where
		smn_cobranzas.smn_rel_desc_forma_pago.smn_rel_desc_forma_pago_id is not null
	${filter}
	
	

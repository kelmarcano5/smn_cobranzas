select
		smn_cobranzas.smn_mov_det_descuento.smn_mov_det_descuento_id,
	${field}
from
	smn_cobranzas.smn_mov_det_descuento
where
		smn_cobranzas.smn_mov_det_descuento.smn_mov_det_descuento_id is not null
	${filter}
	
	

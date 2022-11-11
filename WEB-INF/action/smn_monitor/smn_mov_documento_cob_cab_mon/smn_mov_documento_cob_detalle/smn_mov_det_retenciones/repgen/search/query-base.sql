select
		smn_cobranzas.smn_mov_det_retenciones.smn_mov_det_retenciones_id,
	${field}
from
	smn_cobranzas.smn_mov_det_retenciones
where
		smn_cobranzas.smn_mov_det_retenciones.smn_mov_det_retenciones_id is not null
	${filter}
	
	

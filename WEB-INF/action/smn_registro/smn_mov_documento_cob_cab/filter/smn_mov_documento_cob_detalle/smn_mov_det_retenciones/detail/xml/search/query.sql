select
	smn_cobranzas.smn_mov_det_retenciones.*
from
	smn_cobranzas.smn_mov_det_retenciones
where
	smn_mov_det_retenciones_id = ${fld:id}

select
	smn_mov_documento_cob_det_id	
from 
	smn_cobranzas.smn_mov_documento_cob_detalle
where
	smn_mov_documento_cob_det_id = ${fld:smn_mov_documento_cob_det_id}
	
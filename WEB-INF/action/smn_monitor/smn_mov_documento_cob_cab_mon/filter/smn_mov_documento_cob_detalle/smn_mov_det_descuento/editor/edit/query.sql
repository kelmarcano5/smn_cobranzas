select	
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id, 
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_idioma as mdd_idioma_pl0,
	smn_cobranzas.smn_mov_det_descuento.*
from
	smn_cobranzas.smn_mov_documento_cob_detalle,
	smn_cobranzas.smn_mov_det_descuento 
where
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id=smn_cobranzas.smn_mov_det_descuento.smn_mov_documento_cob_det_id and
	smn_mov_det_descuento_id = ${fld:id} 
	



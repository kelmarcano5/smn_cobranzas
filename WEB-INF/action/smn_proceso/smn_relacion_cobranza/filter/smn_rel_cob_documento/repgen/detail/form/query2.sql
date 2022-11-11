select
		smn_cobranzas.smn_rel_cob_documento.smn_relacion_cobranza_id,
	smn_cobranzas.smn_rel_cob_documento.smn_mov_documento_cob_det_id
from
	smn_cobranzas.smn_rel_cob_documento 
where
	smn_cobranzas.smn_rel_cob_documento.smn_rel_cob_documento_id = ${fld:id}

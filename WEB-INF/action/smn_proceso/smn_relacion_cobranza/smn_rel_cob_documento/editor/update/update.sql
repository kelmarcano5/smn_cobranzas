UPDATE smn_cobranzas.smn_rel_cob_documento SET
	smn_relacion_cobranza_id=${fld:smn_relacion_cobranza_id},
	smn_mov_documento_cob_det_id=${fld:smn_mov_documento_cob_det_id}

WHERE
	smn_rel_cob_documento_id=${fld:id}


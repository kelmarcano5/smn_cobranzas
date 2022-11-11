UPDATE smn_cobranzas.smn_rel_relacion_envio_documento SET
	smn_relacion_envio_cobranza_id=${fld:smn_entidad_rf},
	smn_mov_documento_cob_cab_id=${fld:smn_mov_documento_cob_cab_id}

WHERE
	smn_rel_relacion_envio_documento_id=${fld:id}


select 
	smn_modulo_origen_rf
FROM
	smn_cobranzas.smn_rel_cob_documento
where
	smn_mov_documento_cob_cab_id=${fld:smn_mov_documento_cob_cab_id}
	AND
	smn_relacion_cobranza_id=${fld:smn_relacion_cobranza_id}
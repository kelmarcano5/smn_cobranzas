UPDATE smn_cobranzas.smn_relacion_envio_cobranza SET
	rec_estatus='GE',
	rec_fecha_generacion={d '${def:date}'}
WHERE
	smn_relacion_envio_cobranza_id=${fld:id}

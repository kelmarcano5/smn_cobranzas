UPDATE smn_cobranzas.smn_mov_documento_cob_detalle SET
	mdd_estatus='AP',
	mdd_idioma='${def:locale}',
	mdd_usuario='${def:user}',
	mdd_fecha_registro={d '${def:date}'},
	mdd_hora='${def:time}'
WHERE
	smn_mov_documento_cob_det_id=${fld:id};
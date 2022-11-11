UPDATE smn_cobranzas.smn_centro_cobranza SET
	cco_codigo=${fld:cco_codigo},
	cco_descripcion=${fld:cco_descripcion},
	smn_rol_id=${fld:smn_rol_id},
	smn_auxiliar_id=${fld:smn_auxiliar_id},
	rol_estatus=${fld:rol_estatus},
	rol_idioma='${def:locale}',
	rol_usuario='${def:user}',
	rol_fecha_registro={d '${def:date}'},
	rol_hora='${def:time}'

WHERE
	smn_centro_cobranza_id=${fld:id}


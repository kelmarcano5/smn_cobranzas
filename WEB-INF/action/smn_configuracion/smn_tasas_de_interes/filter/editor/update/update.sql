UPDATE smn_cobranzas.smn_tasas_de_interes SET
	tai_codigo=${fld:tai_codigo},
	tai_descripcion=${fld:tai_descripcion},
	tai_porcentaje=${fld:tai_porcentaje},
	rol_estatus=${fld:rol_estatus},
	rol_vigencia=${fld:rol_vigencia},
	rol_idioma='${def:locale}',
	rol_usuario='${def:user}',
	rol_fecha_registro={d '${def:date}'},
	rol_hora='${def:time}'

WHERE
	smn_tasas_de_interes_id=${fld:id}


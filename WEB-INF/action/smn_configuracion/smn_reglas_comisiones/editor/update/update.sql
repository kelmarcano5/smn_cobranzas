UPDATE smn_cobranzas.smn_reglas_comisiones SET
	smn_tipo_documento_id=${fld:smn_tipo_documento_id},
	smn_documento_id=${fld:smn_documento_id},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	rco_porcentaje=${fld:rco_porcentaje},
	rco_estatus=${fld:rco_estatus},
	rco_vigencia=${fld:rco_vigencia},
	rco_idioma='${def:locale}',
	rco_usuario='${def:user}',
	rco_fecha_registro={d '${def:date}'},
	rco_hora='${def:time}'

WHERE
	smn_reglas_comisiones_id=${fld:id}


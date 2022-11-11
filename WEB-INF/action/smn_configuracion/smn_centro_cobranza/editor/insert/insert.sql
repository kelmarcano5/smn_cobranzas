INSERT INTO smn_cobranzas.smn_centro_cobranza
(
	smn_centro_cobranza_id,
	cco_codigo,
	cco_descripcion,
	smn_rol_id,
	smn_auxiliar_id,
	rol_estatus,
	rol_idioma,
	rol_usuario,
	rol_fecha_registro,
	rol_hora
)
VALUES
(
	${seq:currval@smn_cobranzas.seq_smn_centro_cobranza},
	${fld:cco_codigo},
	${fld:cco_descripcion},
	${fld:smn_rol_id},
	${fld:smn_auxiliar_id},
	${fld:rol_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

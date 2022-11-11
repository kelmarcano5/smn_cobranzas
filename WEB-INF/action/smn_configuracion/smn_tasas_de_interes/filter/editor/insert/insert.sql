INSERT INTO smn_cobranzas.smn_tasas_de_interes
(
	smn_tasas_de_interes_id,
	tai_codigo,
	tai_descripcion,
	tai_porcentaje,
	rol_estatus,
	rol_vigencia,
	rol_idioma,
	rol_usuario,
	rol_fecha_registro,
	rol_hora
)
VALUES
(
	${seq:currval@smn_cobranzas.seq_smn_tasas_de_interes},
	${fld:tai_codigo},
	${fld:tai_descripcion},
	${fld:tai_porcentaje},
	${fld:rol_estatus},
	${fld:rol_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

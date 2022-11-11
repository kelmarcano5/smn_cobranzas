INSERT INTO smn_cobranzas.smn_tipo_documento
(
	smn_tipo_documento_id,
	tdo_codigo,
	tdo_descripcion,
	tdo_tipo_movimiento,
	tdo_estatus,
	tdo_vigencia,
	tdo_idioma,
	tdo_usuario,
	tdo_fecha_registro,
	tdo_hora
)
VALUES
(
	${seq:currval@smn_cobranzas.seq_smn_tipo_documento},
	${fld:tdo_codigo},
	${fld:tdo_descripcion},
	${fld:tdo_tipo_movimiento},
	${fld:tdo_estatus},
	{d '${def:date}'},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

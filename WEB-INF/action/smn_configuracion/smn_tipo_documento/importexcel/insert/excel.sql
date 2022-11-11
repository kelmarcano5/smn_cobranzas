INSERT INTO smn_cobranzas.smn_tipo_documento
(
	smn_tipo_documento_id,
	tdo_codigo,
	tdo_descripcion,
	tdo_tipo_movimiento,
	tdo_estatus,
	tdo_vigencia,
	tdo_fecha_registro
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_tipo_documento},
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)

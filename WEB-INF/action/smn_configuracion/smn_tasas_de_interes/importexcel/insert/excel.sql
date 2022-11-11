INSERT INTO smn_cobranzas.smn_tasas_de_interes
(
	smn_tasas_de_interes_id,
	tai_codigo,
	tai_descripcion,
	tai_porcentaje,
	rol_estatus,
	rol_vigencia,
	rol_fecha_registro
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_tasas_de_interes},
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)

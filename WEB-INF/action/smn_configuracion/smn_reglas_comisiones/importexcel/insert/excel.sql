INSERT INTO smn_cobranzas.smn_reglas_comisiones
(
	smn_reglas_comisiones_id,
	smn_tipo_documento_id,
	smn_documento_id,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	rco_porcentaje,
	rco_estatus,
	rco_vigencia,
	rco_fecha_registro
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_reglas_comisiones},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)

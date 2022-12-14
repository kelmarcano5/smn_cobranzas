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
	rco_idioma,
	rco_usuario,
	rco_fecha_registro,
	rco_hora
)
VALUES
(
	${seq:currval@smn_cobranzas.seq_smn_reglas_comisiones},
	${fld:smn_tipo_documento_id},
	${fld:smn_documento_id},
	${fld:smn_clase_auxiliar_rf},
	${fld:smn_auxiliar_rf},
	${fld:rco_porcentaje},
	${fld:rco_estatus},
	${fld:rco_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

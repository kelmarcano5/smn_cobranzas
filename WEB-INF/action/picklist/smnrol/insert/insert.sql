INSERT INTO smn_cobranzas.smn_rol
(
	smn_rol_id,
	smn_usuario_rf,
	smn_perfil_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	rol_tipo,
	smn_corporacion_rf,
	smn_entidad_rf,
	smn_sucursal_rf,
	rol_posicion_estructura_rf,
	rol_estatus,
	rol_vigencia,
	rol_idioma,
	rol_usuario,
	rol_fecha_registro,
	rol_hora
)
VALUES
(
	${seq:currval@smn_cobranzas.seq_smn_rol},
	${fld:smn_usuario_rf2},
	${fld:smn_perfil_rf2},
	${fld:smn_clase_auxiliar_rf2},
	${fld:smn_auxiliar_rf2},
	${fld:rol_tipo2},
	${fld:smn_corporacion_rf2},
	${fld:smn_entidad_rf2},
	${fld:smn_sucursal_rf2},
	${fld:rol_posicion_estructura_rf2},
	${fld:rol_estatus2},
	${fld:rol_vigencia2},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

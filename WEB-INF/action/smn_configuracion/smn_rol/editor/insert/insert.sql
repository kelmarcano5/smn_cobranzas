INSERT INTO smn_cobranzas.smn_rol
(
	smn_rol_id,
	smn_usuario_rf,
	-- smn_perfil_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	rol_tipo,
	smn_corporacion_rf,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_posicion_estructura_rf,
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
	${fld:smn_usuario_rf},
	-- ${fld:smn_perfil_rf},
	${fld:smn_clase_auxiliar_rf},
	${fld:smn_auxiliar_rf},
	${fld:rol_tipo},
	${fld:smn_corporacion_rf},
	${fld:smn_entidad_rf},
	${fld:smn_sucursal_rf},
	${fld:smn_posicion_estructura_rf},
	${fld:rol_estatus},
	${fld:rol_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

select
	smn_cobranzas.smn_centro_cobranza.smn_centro_cobranza_id,
	cco_codigo,
	cco_descripcion,
	smn_cobranzas.smn_rol.rol_tipo as smn_rol_id_combo,
	smn_base.smn_auxiliar.aux_nombres || ' - ' || smn_base.smn_auxiliar.aux_apellidos smn_auxiliar_id_combo,
	case
		when smn_cobranzas.smn_centro_cobranza.rol_estatus = 'AC' then 'Activo'
		when smn_cobranzas.smn_centro_cobranza.rol_estatus = 'IN' then 'Inactivo'
	end as rol_estatus,
	smn_cobranzas.smn_centro_cobranza.rol_fecha_registro,
	smn_cobranzas.smn_centro_cobranza.rol_usuario,
	smn_cobranzas.smn_centro_cobranza.rol_idioma,
	smn_cobranzas.smn_centro_cobranza.rol_hora
	
from
	smn_cobranzas.smn_centro_cobranza
	INNER JOIN
		smn_cobranzas.smn_rol on smn_cobranzas.smn_centro_cobranza.smn_rol_id = smn_cobranzas.smn_rol.smn_rol_id
	INNER JOIN 
		smn_base.smn_auxiliar on smn_cobranzas.smn_centro_cobranza.smn_auxiliar_id = smn_base.smn_auxiliar.smn_auxiliar_id

where
	smn_centro_cobranza_id is not null
	${filter}
order by
		smn_centro_cobranza_id

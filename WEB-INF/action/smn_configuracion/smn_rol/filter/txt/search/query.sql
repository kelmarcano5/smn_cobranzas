select
	smn_base.smn_estructura_organizacional.eor_nombre,
		smn_cobranzas.smn_rol.smn_rol_id,
	case
	when smn_cobranzas.smn_rol.rol_tipo='SO' then '${lbl:b_applicant} '
	when smn_cobranzas.smn_rol.rol_tipo=' CO' then '${lbl:b_debt_collector} '
	when smn_cobranzas.smn_rol.rol_tipo=' AP' then '${lbl:b_approver}'
	end as rol_tipo,
	case
	when smn_cobranzas.smn_rol.rol_estatus='AC' then '${lbl:b_active}'
	when smn_cobranzas.smn_rol.rol_estatus='IN' then '${lbl:b_inactive}'
	end as rol_estatus,
	smn_cobranzas.smn_rol.smn_usuario_rf,
	smn_cobranzas.smn_rol.smn_perfil_rf,
	smn_cobranzas.smn_rol.smn_clase_auxiliar_rf,
	smn_cobranzas.smn_rol.smn_auxiliar_rf,
	smn_cobranzas.smn_rol.rol_tipo,
	smn_cobranzas.smn_rol.smn_entidad_rf,
	smn_cobranzas.smn_rol.rol_estatus,
	smn_cobranzas.smn_rol.rol_fecha_registro
	
from
	smn_cobranzas.smn_rol
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_cobranzas.smn_rol.smn_posicion_estructura_rf

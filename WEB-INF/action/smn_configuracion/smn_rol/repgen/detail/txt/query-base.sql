select
	smn_base.smn_estructura_organizacional.eor_nombre,
	${field}
from
	smn_cobranzas.smn_rol
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_cobranzas.smn_rol.smn_posicion_estructura_rf
where
		smn_cobranzas.smn_rol.smn_rol_id = ${fld:id}
	

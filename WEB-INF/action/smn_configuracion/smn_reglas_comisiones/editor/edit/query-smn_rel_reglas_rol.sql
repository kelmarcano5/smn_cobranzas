SELECT smn_base.smn_v_usuarios.usr_apellidos ||' - '|| smn_base.smn_v_usuarios.usr_nombres as smn_usuario_rf FROM smn_cobranzas.smn_rel_reglas_rol 
		inner join smn_cobranzas.smn_rol on smn_cobranzas.smn_rol.smn_rol_id = smn_cobranzas.smn_rel_reglas_rol.smn_rol_id
    left outer join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_cobranzas.smn_rol.smn_usuario_rf
    left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_cobranzas.smn_rol.smn_auxiliar_rf
    left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_cobranzas.smn_rol.smn_clase_auxiliar_rf
    left outer join smn_base.smn_perfil ON smn_base.smn_perfil.smn_perfil_id = smn_cobranzas.smn_rol.smn_perfil_rf

  WHERE smn_cobranzas.smn_rel_reglas_rol.smn_reglas_comisiones_id= ${fld:id}
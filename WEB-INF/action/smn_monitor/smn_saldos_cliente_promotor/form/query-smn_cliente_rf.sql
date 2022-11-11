select 
	smn_comercial.smn_cliente.smn_cliente_id as id, 
	smn_base.smn_auxiliar.aux_codigo || ' - ' || smn_base.smn_auxiliar.aux_descripcion as item 
from 
	smn_comercial.smn_cliente, smn_base.smn_auxiliar, smn_seguridad.s_user, smn_base.smn_usuarios 
where 
	smn_comercial.smn_cliente.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id 
	AND
	smn_base.smn_usuarios.smn_user_rf = smn_seguridad.s_user.user_id
	AND 
	smn_base.smn_usuarios.smn_auxiliar_rf = smn_comercial.smn_cliente.smn_promotor_rf
	AND 
	smn_seguridad.s_user.userlogin = '${def:user}'
order by smn_comercial.smn_cliente.smn_auxiliar_rf
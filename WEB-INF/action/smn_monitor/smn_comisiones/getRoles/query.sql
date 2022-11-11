select 
	smn_cobranzas.smn_rol.smn_rol_id as id, 
	smn_base.smn_auxiliar.aux_codigo|| ' - ' || smn_base.smn_auxiliar.aux_descripcion as item 
from 
	smn_cobranzas.smn_rol, smn_base.smn_auxiliar 
where 
	smn_cobranzas.smn_rol.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
	AND
	smn_cobranzas.smn_rol.smn_entidad_rf=${fld:id}
order by smn_cobranzas.smn_rol.smn_auxiliar_rf
select	
	smn_cobranzas.smn_rel_comisiones.*
from
	smn_cobranzas.smn_rol,
	smn_cobranzas.smn_rel_comisiones 
where
	smn_cobranzas.smn_rol.smn_rol_id=smn_cobranzas.smn_rel_comisiones.smn_rol_id and
	smn_rel_comisiones_id = ${fld:id} 
	



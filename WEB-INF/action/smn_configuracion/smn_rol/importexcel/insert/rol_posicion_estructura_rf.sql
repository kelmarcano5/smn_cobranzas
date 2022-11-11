select 
	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id as smn_posicion_estructura_rf_ref 
from   
	smn_base.smn_estructura_organizacional 
where  
	upper(smn_base.smn_estructura_organizacional.eor_nombre) = upper(${fld:smn_posicion_estructura_rf_desc})

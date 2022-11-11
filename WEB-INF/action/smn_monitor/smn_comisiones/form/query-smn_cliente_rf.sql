select 
	smn_comercial.smn_cliente.smn_cliente_id as id, 
	smn_base.smn_auxiliar.aux_codigo|| ' - ' || smn_base.smn_auxiliar.aux_descripcion as item 
from 
	smn_comercial.smn_cliente, smn_base.smn_auxiliar 
where smn_comercial.smn_cliente.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id 
order by smn_comercial.smn_cliente.smn_auxiliar_rf
select 
                 smn_base.smn_sucursales.smn_sucursales_id as id, 
		    smn_base.smn_sucursales.suc_codigo || ' - ' || 
		    smn_base.smn_sucursales.suc_nombre as item 
     from 
	          smn_base.smn_sucursales 
		    order by 2
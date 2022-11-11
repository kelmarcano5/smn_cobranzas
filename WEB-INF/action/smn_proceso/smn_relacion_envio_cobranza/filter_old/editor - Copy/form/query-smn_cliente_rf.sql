select 
                 smn_comercial.smn_cliente.smn_cliente_id as id, 
		    aux.aux_codigo|| ' - ' || 
		    aux.aux_descripcion as item 
     from 
	          smn_comercial.smn_cliente 
		inner join smn_base.smn_auxiliar aux on aux.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
		    order by aux.aux_descripcion

		    
		    

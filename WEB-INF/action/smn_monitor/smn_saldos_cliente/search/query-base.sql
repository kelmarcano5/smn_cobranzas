select	
	case
		when smn_cobranzas.smn_saldo_cliente.scl_estatus='SO' then '${lbl:b_solvente}'
		when smn_cobranzas.smn_saldo_cliente.scl_estatus='VR' then '${lbl:b_vencido_reciente}'
		when smn_cobranzas.smn_saldo_cliente.scl_estatus='VE' then '${lbl:b_vencido}'
		when smn_cobranzas.smn_saldo_cliente.scl_estatus='EM' then '${lbl:b_en_mora}'
	end as scl_estatus_combo,
	(select smn_base.smn_entidades.ent_codigo|| ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_cobranzas.smn_saldo_cliente.smn_entidad_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as smn_entidad_rf_combo,
	(select smn_base.smn_sucursales.suc_codigo|| ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_cobranzas.smn_saldo_cliente.smn_sucursal_rf  order by suc_nombre ) as smn_sucursal_rf_combo,
	(select smn_base.smn_auxiliar.aux_codigo|| ' - ' || smn_base.smn_auxiliar.aux_descripcion from  smn_comercial.smn_cliente, smn_base.smn_auxiliar where smn_comercial.smn_cliente.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id  and smn_comercial.smn_cliente.smn_cliente_id=smn_cobranzas.smn_saldo_cliente.smn_cliente_rf  order by smn_comercial.smn_cliente.smn_auxiliar_rf ) as smn_cliente_rf_combo,
	smn_cobranzas.smn_saldo_cliente.scl_saldo_final_ma,
	smn_cobranzas.smn_saldo_cliente.scl_saldo_vencido_ml,
	smn_cobranzas.smn_saldo_cliente.scl_saldo_vencido_ma,
	smn_cobranzas.smn_saldo_cliente.scl_estatus,
	smn_cobranzas.smn_saldo_cliente.scl_porcentaje_deuda_vencida,
	smn_cobranzas.smn_saldo_cliente.scl_fecha_registro,
	smn_cobranzas.smn_saldo_cliente.smn_entidad_rf,
	smn_cobranzas.smn_saldo_cliente.smn_sucursal_rf,
	smn_cobranzas.smn_saldo_cliente.smn_cliente_rf,
	smn_cobranzas.smn_saldo_cliente.scl_fecha,
	smn_cobranzas.smn_saldo_cliente.scl_saldo_inicial_ml,
	smn_cobranzas.smn_saldo_cliente.scl_debitos_ml,
	smn_cobranzas.smn_saldo_cliente.scl_creditos_ml,
	smn_cobranzas.smn_saldo_cliente.scl_saldo_final_ml,
	smn_cobranzas.smn_saldo_cliente.scl_saldo_inicial_ma,
	smn_cobranzas.smn_saldo_cliente.scl_debitos_ma,
	smn_cobranzas.smn_saldo_cliente.scl_creditos_ma,
	smn_cobranzas.smn_saldo_cliente.smn_saldo_cliente_id

from
	smn_cobranzas.smn_saldo_cliente
where
	smn_saldo_cliente_id is not null	
 	 	${filter}
order by 
	smn_saldo_cliente_id
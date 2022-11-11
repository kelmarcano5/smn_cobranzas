select
	smn_cobranzas.smn_rel_comisiones.smn_rel_comisiones_id,
	smn_cobranzas.smn_relacion_cobranza.rco_estatus_proceso as rco_estatus_proceso_pl0,
	smn_cobranzas.smn_reglas_comisiones.rco_estatus as rco_estatus_pl1,
	smn_cobranzas.smn_rol.rol_tipo as smn_rol_id,
	smn_cobranzas.smn_rol.rol_tipo as rol_tipo_pl2,
	case
		when smn_cobranzas.smn_rel_comisiones.com_estatus_proceso='GE' then '${lbl:b_generated}'
		when smn_cobranzas.smn_rel_comisiones.com_estatus_proceso='IAP' then '${lbl:b_approved}'
	end as com_estatus_proceso,
	case
		when smn_cobranzas.smn_rel_comisiones.com_estatus_financiero='PE' then '${lbl:b_pending}'
		when smn_cobranzas.smn_rel_comisiones.com_estatus_financiero='IPA' then '${lbl:b_paid}'
	end as com_estatus_financiero,
	smn_cobranzas.smn_rel_comisiones.smn_relacion_cobranza_id,
	smn_cobranzas.smn_rel_comisiones.smn_reglas_comisiones_id,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_rf,
	smn_cobranzas.smn_rel_comisiones.com_monto_relacion_ml,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_cobranzas.smn_rel_comisiones.com_monto_relacion_ma,
	smn_cobranzas.smn_rel_comisiones.com_porcentaje,
	smn_cobranzas.smn_rel_comisiones.com_monto_comision_ml,
	smn_cobranzas.smn_rel_comisiones.com_monto_comision_ma,
	smn_cobranzas.smn_rel_comisiones.com_motivo_rechazo,
	smn_cobranzas.smn_rel_comisiones.com_fecha_registro
	
from
	smn_cobranzas.smn_rel_comisiones
	inner join smn_cobranzas.smn_reglas_comisiones on smn_cobranzas.smn_reglas_comisiones.smn_reglas_comisiones_id = smn_cobranzas.smn_rel_comisiones.smn_reglas_comisiones_id
	inner join smn_cobranzas.smn_relacion_cobranza on smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id = smn_cobranzas.smn_rel_comisiones.smn_relacion_cobranza_id
	inner join smn_cobranzas.smn_rol on smn_cobranzas.smn_rol.smn_rol_id = smn_cobranzas.smn_rel_comisiones.smn_rol_id
	inner join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_cobranzas.smn_rel_comisiones.smn_moneda_rf
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_cobranzas.smn_rel_comisiones.smn_cliente_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
where
	smn_rel_comisiones_id = ${fld:id}

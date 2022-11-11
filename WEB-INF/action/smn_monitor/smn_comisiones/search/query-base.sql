select	
	(select smn_base.smn_entidades.ent_codigo|| ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_cobranzas.smn_comisiones.smn_entidad_rf) as smn_entidad_rf_combo,
	(select smn_base.smn_sucursales.suc_codigo|| ' - ' || smn_base.smn_sucursales.suc_nombre from smn_base.smn_sucursales where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_cobranzas.smn_comisiones.smn_sucursal_rf) as smn_sucursal_rf_combo,
	(select smn_base.smn_auxiliar.aux_codigo|| ' - ' || smn_base.smn_auxiliar.aux_descripcion from smn_comercial.smn_cliente, smn_base.smn_auxiliar where smn_comercial.smn_cliente.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id  and smn_comercial.smn_cliente.smn_cliente_id=smn_cobranzas.smn_comisiones.smn_cliente_rf) as smn_cliente_rf_combo,
	(select smn_cobranzas.smn_relacion_cobranza.rco_numero_documento from smn_cobranzas.smn_relacion_cobranza where smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id=smn_cobranzas.smn_comisiones.smn_relacion_cobranza_id) as smn_relacion_cobranza_id_combo,
	(select smn_cobranzas.smn_reglas_comisiones.rco_porcentaje from smn_cobranzas.smn_reglas_comisiones where smn_cobranzas.smn_reglas_comisiones.smn_reglas_comisiones_id=smn_cobranzas.smn_comisiones.smn_reglas_comisiones_id) as smn_reglas_comisiones_id_combo,
	smn_cobranzas.smn_comisiones.com_fecha_proceso,
	smn_cobranzas.smn_comisiones.smn_monto_relacion_ml,
	smn_cobranzas.smn_comisiones.com_porcentaje,
	smn_cobranzas.smn_comisiones.com_monto_comision_ml,
	smn_cobranzas.smn_comisiones.com_monto_comision_ma,
	smn_cobranzas.smn_comisiones.com_fecha_registro
from
	smn_cobranzas.smn_comisiones
where
	smn_comisiones_id is not null	
 	${filter}
order by 
	smn_comisiones_id
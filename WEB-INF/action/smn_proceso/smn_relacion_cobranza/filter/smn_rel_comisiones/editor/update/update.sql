UPDATE smn_cobranzas.smn_rel_comisiones SET
	smn_relacion_cobranza_id=${fld:smn_relacion_cobranza_id},
	smn_reglas_comisiones_id=${fld:smn_reglas_comisiones_id},
	smn_cliente_rf=${fld:smn_cliente_rf},
	smn_rol_id=${fld:smn_rol_id},
	com_monto_relacion_ml=${fld:com_monto_relacion_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	com_monto_relacion_ma=${fld:com_monto_relacion_ma},
	com_porcentaje=${fld:com_porcentaje},
	com_monto_comision_ml=${fld:com_monto_comision_ml},
	com_monto_comision_ma=${fld:com_monto_comision_ma},
	com_estatus_proceso=${fld:com_estatus_proceso},
	com_estatus_financiero=${fld:com_estatus_financiero},
	com_motivo_rechazo=${fld:com_motivo_rechazo},
	com_idioma='${def:locale}',
	com_usuario='${def:user}',
	com_fecha_registro={d '${def:date}'},
	com_hora='${def:time}'

WHERE
	smn_rel_comisiones_id=${fld:id}


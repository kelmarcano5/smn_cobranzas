UPDATE smn_cobranzas.smn_relacion_envio_cobranza SET
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	rec_numero=${fld:rec_numero},
	smn_cliente_rf=${fld:smn_cliente_rf},
	rec_ejecutivo_recibe=${fld:rec_ejecutivo_recibe},
	rec_monto_ml=${fld:rec_monto_ml},
	rec_monto_ma=${fld:rec_monto_ma},
	rec_cantidad_documento=${fld:rec_cantidad_documento},
	rec_estatus=${fld:rec_estatus},
	rec_idioma='${def:locale}',
	rec_usuario='${def:user}',
	rec_fecha_registro={d '${def:date}'},
	rec_hora='${def:time}'

WHERE
	smn_relacion_envio_cobranza_id=${fld:id}


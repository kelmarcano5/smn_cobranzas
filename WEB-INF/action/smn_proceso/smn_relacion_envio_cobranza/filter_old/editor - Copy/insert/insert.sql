INSERT INTO smn_cobranzas.smn_relacion_envio_cobranza
(
	smn_entidad_rf,
	smn_sucursal_rf,
	rec_numero,
	smn_cliente_rf,
	rec_fecha_generacion,
	rec_fecha_entrega,
	rec_ejecutivo_recibe,
	rec_monto_ml,
	rec_monto_ma,
	rec_cantidad_documento,
	rec_estatus,
	rec_idioma,
	rec_usuario,
	rec_fecha_registro,
	rec_hora
)
VALUES
(
	${fld:smn_entidad_rf},
	${fld:smn_sucursal_rf},
	${fld:rec_numero},
	${fld:smn_cliente_rf},
	${fld:rec_fecha_generacion},
	${fld:rec_fecha_entrega},
	${fld:rec_ejecutivo_recibe},
	${fld:rec_monto_ml},
	${fld:rec_monto_ma},
	${fld:rec_cantidad_documento},
	${fld:rec_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

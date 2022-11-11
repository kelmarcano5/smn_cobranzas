UPDATE smn_cobranzas.smn_relacion_envio_cobranza SET
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	rec_fecha_generacion=${fld:rec_fecha_generacion},
	rec_fecha_entrega=${fld:rec_fecha_entrega},
	rec_ejecutivo_recibe=${fld:rec_ejecutivo_recibe},
	rec_monto_ml=${fld:rec_monto_ml},
	rec_monto_ma=${fld:rec_monto_ma},
	rec_cantidad_documento=${fld:rec_cantidad_documento}
	

WHERE
	smn_relacion_envio_cobranza_id=${fld:id}


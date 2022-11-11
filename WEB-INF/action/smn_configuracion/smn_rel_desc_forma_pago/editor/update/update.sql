UPDATE smn_cobranzas.smn_rel_desc_forma_pago SET
	smn_descuentos_retenciones_rf=${fld:smn_descuentos_retenciones_rf},
	smn_forma_pago_id=${fld:smn_forma_pago_id},
	rdf_estatus=${fld:rdf_estatus},
	rdf_idioma='${def:locale}',
	rdf_usuario='${def:user}',
	rdf_fecha_registro={d '${def:date}'},
	rdf_hora='${def:time}'

WHERE
	smn_rel_desc_forma_pago_id=${fld:id}


INSERT INTO smn_cobranzas.smn_rel_desc_forma_pago
(
	smn_rel_desc_forma_pago_id,
	smn_descuentos_retenciones_rf,
	smn_forma_pago_id,
	rdf_estatus,
	rdf_idioma,
	rdf_usuario,
	rdf_fecha_registro,
	rdf_hora
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_rel_desc_forma_pago},
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

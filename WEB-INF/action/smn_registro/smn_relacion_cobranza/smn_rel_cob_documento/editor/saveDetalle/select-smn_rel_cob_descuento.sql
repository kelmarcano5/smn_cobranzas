SELECT
	smn_base.smn_descuentos_retenciones.dyr_porcentaje_base,
	smn_base.smn_descuentos_retenciones.dyr_porcentaje_descuento
FROM
	smn_cobranzas.smn_rel_cob_descuento
	INNER JOIN
	smn_base.smn_descuentos_retenciones ON smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id=smn_cobranzas.smn_rel_cob_descuento.smn_codigo_descuento_rf
WHERE
	smn_relacion_cobranza_id=${fld:smn_relacion_cobranza_id}
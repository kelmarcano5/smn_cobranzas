SELECT
	smn_rel_cob_descuento_id
FROM
	smn_cobranzas.smn_rel_cob_descuento
WHERE
	smn_relacion_cobranza_id = ${fld:smn_relacion_cobranza_id}
	--AND
	--smn_codigo_descuento_rf = ${fld:smn_descuentos_retenciones_id}
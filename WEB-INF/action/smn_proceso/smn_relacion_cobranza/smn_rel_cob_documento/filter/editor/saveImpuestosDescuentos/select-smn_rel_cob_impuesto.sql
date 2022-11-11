SELECT
	smn_rel_cob_impuesto_id
FROM
	smn_cobranzas.smn_rel_cob_impuesto
WHERE
	smn_relacion_cobranza_id = ${fld:smn_relacion_cobranza_id}
	AND
	smn_codigos_impuestos_rf = ${fld:smn_codigos_impuestos_id}
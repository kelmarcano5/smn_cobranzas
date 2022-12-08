SELECT
	smn_base.smn_tasas_de_cambio.tca_tasa_cambio,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_bruto_cob_ml,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_bruto_cob_ma
FROM
	smn_cobranzas.smn_relacion_cobranza
LEFT OUTER JOIN
	smn_base.smn_tasas_de_cambio ON smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_cobranzas.smn_relacion_cobranza.smn_tasa_rf
WHERE
	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id = ${fld:id2}
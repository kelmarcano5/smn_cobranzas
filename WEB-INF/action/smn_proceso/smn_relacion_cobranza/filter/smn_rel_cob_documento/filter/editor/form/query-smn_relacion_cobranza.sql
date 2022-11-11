SELECT
	smn_base.smn_auxiliar.aux_descripcion AS smn_cliente_rf_combo, 
	smn_cobranzas.smn_relacion_cobranza.rco_numero_documento,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_bruto_cob_ml,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_bruto_cob_ma
FROM
	smn_cobranzas.smn_relacion_cobranza
INNER JOIN
	smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_cliente_id = smn_cobranzas.smn_relacion_cobranza.smn_cliente_rf
INNER JOIN
	smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
WHERE
	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id=${fld:id2}
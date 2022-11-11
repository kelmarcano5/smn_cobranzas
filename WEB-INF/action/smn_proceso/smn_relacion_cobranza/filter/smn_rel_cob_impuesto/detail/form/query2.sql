SELECT
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion AS smn_cliente_rf_combo, 
	smn_cobranzas.smn_relacion_cobranza.rco_numero_documento,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_bruto_cob_ml
FROM
	smn_cobranzas.smn_relacion_cobranza
INNER JOIN
	smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_cliente_id = smn_cobranzas.smn_relacion_cobranza.smn_cliente_rf
INNER JOIN
	smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
INNER JOIN
	smn_cobranzas.smn_rel_cob_impuesto ON smn_cobranzas.smn_rel_cob_impuesto.smn_relacion_cobranza_id=smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id
WHERE
	smn_cobranzas.smn_rel_cob_impuesto.smn_rel_cob_impuesto_id=${fld:id}
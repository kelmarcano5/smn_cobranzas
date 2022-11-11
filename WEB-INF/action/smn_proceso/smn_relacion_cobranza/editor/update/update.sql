UPDATE smn_cobranzas.smn_relacion_cobranza SET
	smn_modulo_rf=${fld:smn_modulo_rf},
	smn_doc_orig_rf=${fld:smn_doc_orig_rf},
	smn_num_doc_orig=${fld:smn_num_doc_orig},
	smn_documento_id=${fld:smn_documento_id},
	rco_numero_documento=${fld:rco_numero_documento},
	smn_cliente_rf=${fld:smn_cliente_rf},
	rco_monto_bruto_cob_ml=${fld:rco_monto_bruto_cob_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	rco_monto_bruto_cob_ma=${fld:rco_monto_bruto_cob_ma},
	rco_monto_desc_ret_cob_ml=${fld:rco_monto_desc_ret_cob_ml},
	rco_monto_desc_ret_cob_ma=${fld:rco_monto_desc_ret_cob_ma},
	rco_monto_neto_cob_ml=${fld:rco_monto_neto_cob_ml},
	rco_monto_neto_cob_ma=${fld:rco_monto_neto_cob_ma},
	rco_estatus_proceso=${fld:rco_estatus_proceso},
	rco_idioma='${def:locale}',
	rco_usuario='${def:user}',
	rco_fecha_registro={d '${def:date}'},
	rco_hora='${def:time}'

WHERE
	smn_relacion_cobranza_id=${fld:id}


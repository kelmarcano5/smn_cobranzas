UPDATE smn_cobranzas.smn_mov_documento_cob_cab SET
	smn_modulo_origen_rf=${fld:smn_modulo_origen_rf},
	smn_documento_rf=${fld:smn_documento_rf},
	mdc_numero_doc_origen=${fld:mdc_numero_doc_origen},
	smn_cliente_rf=${fld:smn_cliente_rf},
	mdc_fecha_documento=${fld:mdc_fecha_documento},
	mdc_fecha_vencimiento=${fld:mdc_fecha_vencimiento},
	mdc_monto_ml=${fld:mdc_monto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	mdc_monto_ma=${fld:mdc_monto_ma},
	mdc_saldo_doc_ml=${fld:mdc_saldo_doc_ml},
	mdc_saldo_doc_ma=${fld:mdc_saldo_doc_ma},
	mdc_estatus_proceso=${fld:mdc_estatus_proceso},
	mdc_estatus_financiero=${fld:mdc_estatus_financiero},
	mdc_idioma='${def:locale}',
	mdc_usuario='${def:user}',
	mdc_fecha_registro={d '${def:date}'},
	mdc_hora='${def:time}'

WHERE
	smn_mov_documento_cob_cab_id=${fld:id}


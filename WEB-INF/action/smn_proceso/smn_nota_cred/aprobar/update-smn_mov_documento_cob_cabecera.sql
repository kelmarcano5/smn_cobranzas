UPDATE smn_cobranzas.smn_mov_documento_cob_cab SET
	mdc_saldo_doc_ml=${fld:mdc_saldo_doc_ml},
	mdc_saldo_doc_ma=${fld:mdc_saldo_doc_ma},
	mdc_idioma='${def:locale}',
	mdc_usuario='${def:user}',
	mdc_fecha_registro={d '${def:date}'},
	mdc_hora='${def:time}'
WHERE
	smn_mov_documento_cob_cab_id=${fld:id2};
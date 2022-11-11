UPDATE smn_cobranzas.smn_mov_documento_cob_cab SET
	mdc_saldo_doc_ml = ${fld:mdc_saldo_doc_ml},
	mdc_saldo_doc_ma = ${fld:mdc_saldo_doc_ma},
	mdc_estatus_proceso = ${fld:mdc_estatus_proceso},
	mdc_estatus_financiero = ${fld:mdc_estatus_financiero}
WHERE
	smn_mov_documento_cob_cab_id = ${fld:smn_mov_doc_cob_cab_id};
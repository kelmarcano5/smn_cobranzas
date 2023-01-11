UPDATE smn_cobranzas.smn_mov_documento_cob_cab SET
	mdc_saldo_doc_ml= ${fld:mdc_saldo_doc_ml},
	mdc_saldo_doc_ma= ${fld:mdc_saldo_doc_ma},
	mdc_idioma='${def:locale}',
	mdc_fecha_registro={d '${def:date}'},
	mdc_hora='${def:time}'
WHERE 
	smn_mov_documento_cob_cab_id=${fld:id2};


UPDATE smn_cobranzas.smn_mov_documento_cob_detalle SET
	mdd_estatus='AP',
	mdd_idioma='${def:locale}',
	mdd_fecha_registro={d '${def:date}'},
	mdd_hora='${def:time}',
	mdd_control_fiscal=(SELECT (cfd_ultimo_numero_fiscal_usado+1) 
							FROM smn_comercial.smn_control_fiscal_documento) 
WHERE 
	smn_mov_documento_cob_det_id=${fld:id};


UPDATE smn_comercial.smn_control_fiscal_documento SET
	cfd_ultimo_numero_fiscal_usado=cfd_ultimo_numero_fiscal_usado+1	

-- WHERE smn_documento_id='${fld:doc_id}' 


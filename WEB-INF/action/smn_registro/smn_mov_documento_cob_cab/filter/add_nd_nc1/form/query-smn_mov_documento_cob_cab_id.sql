select 
	mdc_saldo_doc_ml,
	mdc_saldo_doc_ma,
	smn_moneda_rf
from 
	smn_cobranzas.smn_mov_documento_cob_cab
WHERE
	smn_mov_documento_cob_cab_id=${fld:smn_mov_documento_cob_cab_id}
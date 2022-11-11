SELECT 
sum (mdc_saldo_doc_ml) as monto_doc_ml,
sum (mdc_saldo_doc_ma) as monto_doc_ma,
count(distinct(smn_mov_documento_cob_cab_id)) as cant_doc


from smn_cobranzas.smn_mov_documento_cob_cab 

where smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf=${fld:id}
		and mdc_estatus_proceso = 'RE'


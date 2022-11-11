/*SELECT 
smn_mov_documento_cob_cab_id,
mdc_numero_doc_origen,
mdc_saldo_doc_ml,
mdc_saldo_doc_ma


from smn_cobranzas.smn_mov_documento_cob_cab 

where smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf=${fld:id}
		and mdc_estatus_proceso = 'RE'*/

SELECT 
smn_mov_documento_cob_cab_id,
mdc_numero_factura,
mdc_saldo_doc_ml,
mdc_saldo_doc_ma


from smn_cobranzas.smn_mov_documento_cob_cab 

where smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf=${fld:id}
		and mdc_estatus_proceso = 'RE'		



/*SELECT 
sum (mdc_saldo_doc_ml) as monto_doc_ml,
sum (mdc_saldo_doc_ma) as monto_doc_ma,
count(distinct(smn_mov_documento_cob_cab_id)) as cant_doc


from smn_cobranzas.smn_mov_documento_cob_cab 

where smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf=${fld:id}
		and mdc_estatus_proceso = 'RE'
*/

SELECT 
sum (mdc_saldo_doc_ml) as monto_doc_ml,
sum (mdc_saldo_doc_ma) as monto_doc_ma,
count(distinct(mov_cob_cab.smn_mov_documento_cob_cab_id)) as cant_doc


from smn_cobranzas.smn_mov_documento_cob_cab mov_cob_cab inner join
	smn_cobranzas.smn_rel_relacion_envio_documento rel_rel_envio_doc on
	mov_cob_cab.smn_mov_documento_cob_cab_id=rel_rel_envio_doc.smn_mov_documento_cob_cab_id

where rel_rel_envio_doc.smn_relacion_envio_cobranza_id=${fld:id}
	and mdc_estatus_proceso = 'RE'

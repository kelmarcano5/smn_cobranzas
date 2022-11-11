SELECT 
smn_mov_documento_cob_cab_id,
mdc_numero_doc_origen,
mdc_saldo_doc_ml,
mdc_saldo_doc_ma

from smn_cobranzas.smn_mov_documento_cob_cab 
inner join smn_cobranzas.smn_relacion_envio_cobranza rel_envio on
	rel_envio.smn_cliente_rf = smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf

where mdc_estatus_proceso = 'RE' and rel_envio.smn_relacion_envio_cobranza_id=${fld:id}
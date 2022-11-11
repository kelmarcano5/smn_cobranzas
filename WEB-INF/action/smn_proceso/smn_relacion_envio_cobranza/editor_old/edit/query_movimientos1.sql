SELECT 
mdc_numero_factura as factura1,
mdc_saldo_doc_ml as mdc_saldo_doc_ml_1 ,
mdc_saldo_doc_ma as mdc_saldo_doc_ma_1

from smn_cobranzas.smn_rel_relacion_envio_documento rel_rel_envio 
inner join smn_cobranzas.smn_mov_documento_cob_cab on
rel_rel_envio.smn_mov_documento_cob_cab_id=smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id

where mdc_estatus_proceso = 'RE' and rel_rel_envio.smn_relacion_envio_cobranza_id=${fld:id}

order by factura1 ASC
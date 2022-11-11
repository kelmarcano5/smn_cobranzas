SELECT 
sum (mdc_saldo_doc_ml) as monto_doc_ml,
sum (mdc_saldo_doc_ma) as monto_doc_ma,
count(distinct(mov.smn_mov_documento_cob_cab_id)) as cant_doc

from smn_cobranzas.smn_mov_documento_cob_cab mov

inner join smn_cobranzas.smn_rel_relacion_envio_documento red on red.smn_mov_documento_cob_cab_id=mov.smn_mov_documento_cob_cab_id

inner join  smn_cobranzas.smn_relacion_envio_cobranza rel_envio on rel_envio.smn_relacion_envio_cobranza_id=red.smn_relacion_envio_cobranza_id

where red.smn_relacion_envio_cobranza_id=${fld:id}


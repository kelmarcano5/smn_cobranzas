SELECT 
smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id,
mdc_numero_factura,
mdc_saldo_doc_ml,
mdc_saldo_doc_ma,
true as marcado

from smn_cobranzas.smn_mov_documento_cob_cab 

inner join smn_cobranzas.smn_rel_relacion_envio_documento red on red.smn_mov_documento_cob_cab_id=smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id
inner join  smn_cobranzas.smn_relacion_envio_cobranza rel_envio on rel_envio.smn_relacion_envio_cobranza_id=red.smn_relacion_envio_cobranza_id

where rel_envio.smn_relacion_envio_cobranza_id=${fld:id2}

UNION

SELECT 
mov.smn_mov_documento_cob_cab_id,
mdc_numero_factura,
mdc_saldo_doc_ml,
mdc_saldo_doc_ma,
false as marcado

from smn_cobranzas.smn_mov_documento_cob_cab mov

left join smn_cobranzas.smn_rel_relacion_envio_documento red on red.smn_mov_documento_cob_cab_id=mov.smn_mov_documento_cob_cab_id
--inner join  smn_cobranzas.smn_relacion_envio_cobranza rel_envio on rel_envio.smn_relacion_envio_cobranza_id=red.smn_relacion_envio_cobranza_id
where mdc_estatus_proceso = 'RE' and mov.smn_cliente_rf=${fld:id1}
and red.smn_relacion_envio_cobranza_id is null

order by mdc_numero_factura ASC
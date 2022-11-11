select
		smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id,
	smn_cobranzas.smn_documento.smn_documento_id,
	smn_cobranzas.smn_documento.doc_codigo as doc_codigo_pl0,
select
		smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id,
select
		smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id,
select
		smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id,
select
		smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id,
	case
	when smn_cobranzas.smn_relacion_cobranza.rco_estatus_proceso='RE' then '${lbl:b_registrated}'
	when smn_cobranzas.smn_relacion_cobranza.rco_estatus_proceso='GE' then '${lbl:b_generated}'
	when smn_cobranzas.smn_relacion_cobranza.rco_estatus_proceso='CO' then '${lbl:b_contabilited} '
	end as rco_estatus_proceso,
	smn_cobranzas.smn_relacion_cobranza.smn_modulo_rf,
	smn_cobranzas.smn_relacion_cobranza.smn_doc_orig_rf,
	smn_cobranzas.smn_relacion_cobranza.smn_num_doc_orig,
	smn_cobranzas.smn_relacion_cobranza.smn_documento_id,
	smn_cobranzas.smn_relacion_cobranza.smn_cliente_rf,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_bruto_cob_ml,
	smn_cobranzas.smn_relacion_cobranza.rco_estatus_proceso,
	smn_cobranzas.smn_relacion_cobranza.rco_fecha_registro
	
from
	smn_cobranzas.smn_documento,
	smn_cobranzas.smn_relacion_cobranza
where
	smn_cobranzas.smn_documento.smn_documento_id=smn_cobranzas.smn_relacion_cobranza.smn_documento_id

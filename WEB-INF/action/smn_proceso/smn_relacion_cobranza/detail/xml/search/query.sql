select
		smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id,
	smn_cobranzas.smn_documento.doc_codigo as doc_codigo_pl0,
	case
	when smn_cobranzas.smn_relacion_cobranza.rco_estatus_proceso='RE' then '${lbl:b_registrated}'
	when smn_cobranzas.smn_relacion_cobranza.rco_estatus_proceso='GE' then '${lbl:b_generated}'
	when smn_cobranzas.smn_relacion_cobranza.rco_estatus_proceso='CO' then '${lbl:b_contabilited}'
	end as rco_estatus_proceso,
	smn_cobranzas.smn_documento.doc_descripcion as smn_documento_id,
	smn_base.smn_modulos.mod_nombre as smn_modulo_rf,
	smn_base.smn_documentos_generales.dcg_descripcion as smn_doc_orig_rf,
	smn_cobranzas.smn_relacion_cobranza.smn_num_doc_orig,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_rf,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_bruto_cob_ml,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_desc_ret_cob_ml,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_desc_ret_cob_ma,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_bruto_cob_ma,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_neto_cob_ml,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_neto_cob_ma,
	smn_cobranzas.smn_relacion_cobranza.rco_numero_documento,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_cobranzas.smn_relacion_cobranza.rco_fecha_registro
	
from
	smn_cobranzas.smn_relacion_cobranza
	inner join smn_cobranzas.smn_documento on smn_cobranzas.smn_documento.smn_documento_id = smn_cobranzas.smn_relacion_cobranza.smn_documento_id
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_cobranzas.smn_relacion_cobranza.smn_cliente_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_cobranzas.smn_relacion_cobranza.smn_moneda_rf
	inner join smn_base.smn_modulos on smn_base.smn_modulos.smn_modulos_id = smn_cobranzas.smn_relacion_cobranza.smn_modulo_rf
	inner join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id = smn_cobranzas.smn_relacion_cobranza.smn_doc_orig_rf



where
	smn_cobranzas.smn_documento.smn_documento_id=smn_cobranzas.smn_relacion_cobranza.smn_documento_id
	and
	smn_relacion_cobranza_id = ${fld:id}

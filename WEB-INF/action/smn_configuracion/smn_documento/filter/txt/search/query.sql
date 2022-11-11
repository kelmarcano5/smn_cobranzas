select
		smn_cobranzas.smn_documento.smn_documento_id,
	smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id,
	smn_cobranzas.smn_tipo_documento.tdo_codigo as tdo_codigo_pl0,
select
		smn_cobranzas.smn_documento.smn_documento_id,
	case
	when smn_cobranzas.smn_documento.doc_afec_documento='SI' then '${lbl:b_yes}'
	when smn_cobranzas.smn_documento.doc_afec_documento='NO' then '${lbl:b_not}'
	end as doc_afec_documento,
	case
	when smn_cobranzas.smn_documento.doc_usa_moneda_alterna='SI' then '${lbl:b_yes}'
	when smn_cobranzas.smn_documento.doc_usa_moneda_alterna='NO' then '${lbl:b_not}'
	end as doc_usa_moneda_alterna,
	case
	when smn_cobranzas.smn_documento.doc_estatus='AC' then '${lbl:b_active}'
	when smn_cobranzas.smn_documento.doc_estatus='IN' then '${lbl:b_inactive}'
	end as doc_estatus,
	smn_cobranzas.smn_documento.smn_tipo_documento_id,
	smn_cobranzas.smn_documento.doc_codigo,
	smn_cobranzas.smn_documento.doc_descripcion,
	smn_cobranzas.smn_documento.doc_afec_documento,
	smn_cobranzas.smn_documento.doc_usa_moneda_alterna,
	smn_cobranzas.smn_documento.doc_estatus,
	smn_cobranzas.smn_documento.doc_fecha_registro
	
from
	smn_cobranzas.smn_tipo_documento,
	smn_cobranzas.smn_documento
where
	smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id=smn_cobranzas.smn_documento.smn_tipo_documento_id

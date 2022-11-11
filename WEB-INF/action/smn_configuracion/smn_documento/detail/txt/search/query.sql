select
	smn_cobranzas.smn_tipo_documento.tdo_codigo as tdo_codigo_pl0,
	case
	when smn_cobranzas.smn_documento.doc_afec_documento='SI' then '${lbl:b_yes}'
	when smn_cobranzas.smn_documento.doc_afec_documento='NO' then '${lbl:b_not}'
	end as doc_afec_documento,
	case
	when smn_cobranzas.smn_documento.doc_usa_moneda_alterna='SI' then '${lbl:b_yes}'
	when smn_cobranzas.smn_documento.doc_usa_moneda_alterna='NO' then '${lbl:b_not}'
	end as doc_usa_moneda_alterna,
	case
	when smn_cobranzas.smn_documento.doc_multiples_pagador='SI' then '${lbl:b_yes}'
	when smn_cobranzas.smn_documento.doc_multiples_pagador='NO' then '${lbl:b_not}'
	end as doc_multiples_pagador,
	case
	when smn_cobranzas.smn_documento.doc_estatus='AC' then '${lbl:b_active}'
	when smn_cobranzas.smn_documento.doc_estatus='IN' then '${lbl:b_inactive}'
	end as doc_estatus,
	smn_cobranzas.smn_tipo_documento.tdo_descripcion as smn_tipo_documento_id,
	smn_cobranzas.smn_documento.doc_codigo,
	smn_cobranzas.smn_documento.doc_descripcion,
	smn_cobranzas.smn_documento.doc_afec_documento,
	smn_cobranzas.smn_documento.doc_usa_moneda_alterna,
  smn_cobranzas.smn_documento.doc_vigencia,
	smn_base.smn_documentos_generales.dcg_descripcion as smn_documento_general_rf,
	smn_cobranzas.smn_documento.doc_fecha_registro
from
	smn_cobranzas.smn_documento
inner join smn_cobranzas.smn_tipo_documento on smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id=smn_cobranzas.smn_documento.smn_documento_id
inner join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id=smn_cobranzas.smn_documento.smn_documento_general_rf

where
	smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id=smn_cobranzas.smn_documento.smn_tipo_documento_id
	and
	smn_documento_id = ${fld:id}

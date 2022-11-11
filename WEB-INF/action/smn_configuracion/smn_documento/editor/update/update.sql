UPDATE smn_cobranzas.smn_documento SET
	smn_documento_general_rf=${fld:smn_documento_general_rf},
	smn_tipo_documento_id=${fld:smn_tipo_documento_id},
	doc_codigo=${fld:doc_codigo},
	doc_descripcion=${fld:doc_descripcion},
	doc_afec_documento=${fld:doc_afec_documento},
	doc_usa_moneda_alterna=${fld:doc_usa_moneda_alterna},
	doc_multiples_pagador=${fld:doc_multiples_pagador},
	doc_estatus=${fld:doc_estatus},
	doc_vigencia=${fld:doc_vigencia},
	doc_idioma='${def:locale}',
	doc_usuario='${def:user}',
	doc_fecha_registro={d '${def:date}'},
	doc_hora='${def:time}'

WHERE
	smn_documento_id=${fld:id}


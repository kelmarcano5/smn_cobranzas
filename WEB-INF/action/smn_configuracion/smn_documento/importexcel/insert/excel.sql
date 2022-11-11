INSERT INTO smn_cobranzas.smn_documento
(
	smn_documento_id,
	smn_documento_general_rf,
	smn_tipo_documento_id,
	doc_codigo,
	doc_descripcion,
	doc_afec_documento,
	doc_usa_moneda_alterna,
	doc_multiples_pagador,
	doc_estatus,
	doc_vigencia,
	doc_fecha_registro
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_documento},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)

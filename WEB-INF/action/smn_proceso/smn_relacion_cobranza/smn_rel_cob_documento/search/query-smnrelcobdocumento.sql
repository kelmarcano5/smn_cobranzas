SELECT
	smn_cobranzas.smn_rel_cob_documento.smn_rel_cob_documento_id,
	--smn_cobranzas.smn_documento.doc_codigo ||' - '|| smn_cobranzas.smn_documento.doc_descripcion AS smn_documento_id_combo,
	smn_cobranzas.smn_mov_documento_cob_cab.*
FROM
	smn_cobranzas.smn_rel_cob_documento
INNER JOIN
	smn_cobranzas.smn_mov_documento_cob_cab ON smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id = smn_cobranzas.smn_rel_cob_documento.smn_mov_documento_cob_cab_id
INNER JOIN
	smn_cobranzas.smn_relacion_cobranza ON smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id = smn_cobranzas.smn_rel_cob_documento.smn_relacion_cobranza_id
--INNER JOIN
--	smn_cobranzas.smn_documento ON smn_cobranzas.smn_documento.smn_documento_id = smn_cobranzas.smn_mov_documento_cob_cab.smn_documento_rf
WHERE
	smn_cobranzas.smn_rel_cob_documento.smn_relacion_cobranza_id=${fld:id}

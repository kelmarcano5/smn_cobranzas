-- SELECT 
-- 	smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id AS id,
-- 	smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen AS item, 
-- 	smn_cobranzas.smn_mov_documento_cob_cab.mdc_saldo_doc_ml,
-- 	smn_cobranzas.smn_mov_documento_cob_cab.mdc_saldo_doc_ma
-- FROM 
-- 	smn_cobranzas.smn_mov_documento_cob_cab
-- INNER JOIN
-- 	smn_cobranzas.smn_documento ON smn_cobranzas.smn_documento.smn_documento_id=smn_cobranzas.smn_mov_documento_cob_cab.smn_documento_id
-- INNER JOIN
-- 	smn_cobranzas.smn_relacion_cobranza ON smn_cobranzas.smn_relacion_cobranza.smn_cliente_rf=smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf

-- WHERE
-- 	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id=${fld:id2}
-- ORDER BY
-- 	smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen

	
SELECT 
	smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id AS id,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen AS item, 
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_saldo_doc_ml,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_saldo_doc_ma,
	(select smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id FROM smn_cobranzas.smn_mov_documento_cob_detalle
	 		WHERE smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id = smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id
	 		ORDER BY smn_cobranzas.smn_mov_documento_cob_detalle.mdd_fecha_registro DESC
	 		LIMIT 1) as detalle_id
FROM 
	smn_cobranzas.smn_mov_documento_cob_cab
INNER JOIN
	smn_cobranzas.smn_documento ON smn_cobranzas.smn_documento.smn_documento_id=smn_cobranzas.smn_mov_documento_cob_cab.smn_documento_id
INNER JOIN
	smn_cobranzas.smn_relacion_cobranza ON smn_cobranzas.smn_relacion_cobranza.smn_cliente_rf=smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf
 

WHERE
	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id=${fld:id2}
ORDER BY
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen
	
INSERT INTO smn_cobranzas.smn_rel_cob_documento
(
	smn_rel_cob_documento_id,
	smn_relacion_cobranza_id,
	smn_mov_documento_cob_cab_id,
	smn_mov_documento_cob_det_id
)
VALUES
(
	${seq:currval@smn_cobranzas.seq_smn_rel_cob_documento},
	${fld:smn_relacion_cobranza_id},
	${fld:smn_mov_documento_cob_cab_id},
	${fld:smn_mov_documento_cob_det_id}
);

UPDATE smn_cobranzas.smn_relacion_cobranza SET 
	rco_monto_documento_ml=${fld:rcd_monto_bruto_ml},
	rco_monto_documento_ma=${fld:rcd_monto_bruto_ma},
	rco_monto_desc_ret_cob_ml=${fld:rcd_monto_disminucion_ml},
	rco_monto_desc_ret_cob_ma=${fld:rcd_monto_disminucion_ma},
	rco_monto_impuesto_ml=${fld:rcd_monto_valor_agregado_ml},
	rco_monto_impuesto_ma=${fld:rcd_monto_valor_agregado_ma},
	rco_monto_neto_cob_ml=${fld:rcd_monto_neto_ml},
	rco_monto_neto_cob_ma=${fld:rcd_monto_neto_ma},
	rco_monto_diferencial_cambiario=${fld:rco_monto_diferencial_cambiario}
WHERE
	smn_relacion_cobranza_id=${fld:smn_relacion_cobranza_id}
SELECT
	SUM(mdd_monto_ml) AS mdd_monto_ml,
	SUM(mdd_diferencia_cambiario) AS mdd_diferencia_cambiario,
	SUM(mdd_monto_descuento_ml) AS mdd_monto_descuento_ml,
	SUM(mdd_monto_ma) AS mdd_monto_ma,
	SUM(mdd_monto_descuento_ma) AS mdd_monto_descuento_ma
FROM
	smn_cobranzas.smn_mov_documento_cob_detalle
WHERE
	smn_mov_documento_cob_cab_id=${fld:smn_mov_documento_cob_cab_id}
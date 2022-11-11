SELECT
	SUM(mdd_monto_ml) AS mdd_monto_ml_total,
	SUM(mdd_monto_ma) AS mdd_monto_ma_total,
	SUM(mdd_saldo_ml) AS mdd_saldo_ml_total,
	SUM(mdd_saldo_ma) AS mdd_saldo_ma_total
FROM
	smn_cobranzas.smn_mov_documento_cob_detalle
WHERE
	smn_mov_documento_cob_cab_id = ${fld:id2}
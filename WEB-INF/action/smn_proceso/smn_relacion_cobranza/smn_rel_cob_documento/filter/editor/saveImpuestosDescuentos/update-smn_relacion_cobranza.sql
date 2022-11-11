UPDATE smn_cobranzas.smn_relacion_cobranza SET
	rco_monto_desc_ret_cob_ml = ${fld:sum_descuento_ml},
	rco_monto_desc_ret_cob_ma = ${fld:sum_descuento_ma},
	rco_monto_impuesto_ml = ${fld:sum_impuesto_ml},
	rco_monto_impuesto_ma = ${fld:sum_impuesto_ma},
	rco_monto_neto_cob_ml = ${fld:monto_neto_ml_redondeo},
	rco_monto_neto_cob_ma = ${fld:monto_neto_ma_redondeo} 
WHERE
	smn_relacion_cobranza_id = ${fld:smn_relacion_cobranza_id};
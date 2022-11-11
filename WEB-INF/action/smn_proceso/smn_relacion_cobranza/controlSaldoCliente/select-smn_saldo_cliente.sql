SELECT
	*
FROM
	smn_cobranzas.smn_saldo_cliente
WHERE
	smn_entidad_rf=${fld:smn_entidad_rf}
	AND
	smn_cliente_rf=${fld:smn_cliente_rf}
order by scl_fecha desc
limit 1
SELECT
	smn_base.smn_auxiliar.smn_auxiliar_id,
	smn_base.smn_auxiliar.aux_rif
FROM
	smn_comercial.smn_cliente
	INNER JOIN
	smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id=smn_comercial.smn_cliente.smn_auxiliar_rf
WHERE
	smn_comercial.smn_cliente.smn_cliente_id=${fld:smn_cliente_rf}
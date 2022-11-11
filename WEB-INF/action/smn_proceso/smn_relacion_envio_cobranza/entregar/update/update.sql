UPDATE smn_cobranzas.smn_relacion_envio_cobranza SET
	rec_fecha_entrega=${fld:rec_fecha_entrega},
	rec_ejecutivo_recibe=${fld:rec_ejecutivo_recibe},
	rec_estatus='EN'
WHERE
	smn_relacion_envio_cobranza_id=${fld:id};

WITH condicion_financiera AS (
	SELECT 
		smn_base.smn_condicion_financiera.cfi_cant_dias,
		smn_cobranzas.smn_relacion_envio_cobranza.smn_cliente_rf
	FROM 
		smn_base.smn_condicion_financiera
		INNER JOIN
		smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_condicion_financiera_rf=smn_base.smn_condicion_financiera.smn_condicion_financiera_id
		INNER JOIN
		smn_cobranzas.smn_relacion_envio_cobranza ON smn_cobranzas.smn_relacion_envio_cobranza.smn_cliente_rf=smn_comercial.smn_cliente.smn_cliente_id
	WHERE
		smn_cobranzas.smn_relacion_envio_cobranza.smn_relacion_envio_cobranza_id=${fld:id}
)

UPDATE smn_cobranzas.smn_mov_documento_cob_cab SET 
	mdc_fecha_vencimiento=to_date(to_char(CAST(${fld:rec_fecha_entrega} AS DATE) + CAST(condicion_financiera.cfi_cant_dias||' days' AS INTERVAL),'YYYY-MM-DD'),'YYYY-MM-DD')
FROM 
	condicion_financiera
WHERE
	smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf=condicion_financiera.smn_cliente_rf
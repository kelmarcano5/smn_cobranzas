select	
	*
from
	smn_base.smn_descuentos_retenciones
INNER JOIN 
	smn_cobranzas.smn_rel_desc_forma_pago ON smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id=smn_cobranzas.smn_rel_desc_forma_pago.smn_descuentos_retenciones_rf
INNER JOIN
	smn_cobranzas.smn_relacion_cobranza ON smn_cobranzas.smn_relacion_cobranza.smn_forma_pago_rf=smn_cobranzas.smn_rel_desc_forma_pago.smn_formas_pago_rf
WHERE
	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id=${fld:smn_relacion_cobranza_id}
	AND
	smn_descuentos_retenciones_id is not null
	${filter}
ORDER BY
	dyr_codigo
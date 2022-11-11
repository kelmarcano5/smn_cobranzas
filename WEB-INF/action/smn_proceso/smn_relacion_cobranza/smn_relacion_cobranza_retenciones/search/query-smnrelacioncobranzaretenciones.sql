select
	smn_cobranzas.smn_relacion_cobranza_retenciones.smn_relacion_cobranza_retenciones_id,
	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id,
	smn_cobranzas.smn_relacion_cobranza_retenciones.smn_clave_aprobacion_pedido,
	smn_cobranzas.smn_relacion_cobranza_retenciones.smn_relacion_cobranza_id,
  	smn_base.smn_descuentos_retenciones.dyr_descripcion as smn_codigo_retenciones_rf,
	smn_cobranzas.smn_relacion_cobranza_retenciones.rcr_monto_retenciones_ml,
	smn_cobranzas.smn_relacion_cobranza_retenciones.smn_moneda_rf,
	smn_cobranzas.smn_relacion_cobranza_retenciones.rcr_monto_retenciones_ma,
	smn_cobranzas.smn_relacion_cobranza_retenciones.rcr_fecha_registro
	
from
	smn_cobranzas.smn_relacion_cobranza_retenciones
	inner join smn_cobranzas.smn_relacion_cobranza on smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id = smn_cobranzas.smn_relacion_cobranza_retenciones.smn_relacion_cobranza_id
	inner join smn_base.smn_descuentos_retenciones on smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id = smn_cobranzas.smn_relacion_cobranza_retenciones.smn_codigo_retenciones_rf
where
	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id=${fld:id2}

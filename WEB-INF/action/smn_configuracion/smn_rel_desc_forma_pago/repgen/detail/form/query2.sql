select
		smn_cobranzas.smn_rel_desc_forma_pago.smn_descuentos_retenciones_rf,
	smn_cobranzas.smn_rel_desc_forma_pago.smn_forma_pago_id,
	smn_cobranzas.smn_rel_desc_forma_pago.rdf_estatus,
	smn_cobranzas.smn_rel_desc_forma_pago.rdf_fecha_registro
from
	smn_cobranzas.smn_rel_desc_forma_pago 
where
	smn_cobranzas.smn_rel_desc_forma_pago.smn_rel_desc_forma_pago_id = ${fld:id}

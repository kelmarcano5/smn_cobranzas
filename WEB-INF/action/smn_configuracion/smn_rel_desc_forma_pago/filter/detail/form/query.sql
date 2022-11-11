select
	smn_cobranzas.smn_rel_desc_forma_pago.smn_rel_desc_forma_pago_id,
	smn_base.smn_descuentos_retenciones.dyr_codigo || ' - ' || smn_base.smn_descuentos_retenciones.dyr_descripcion as smn_descuentos_retenciones_combo,
	smn_base.smn_formas_pago.fop_codigo || ' - ' || smn_base.smn_formas_pago.fop_descripcion as smn_formas_pago_combo,
	case
		when rdf_estatus = 'AC' then 'Activo'
		when rdf_estatus = 'IN' then 'Inactivo'
	end as rdf_estatus,
	rdf_fecha_registro,
	rdf_idioma,
	rdf_hora,
	rdf_usuario
	
from
	smn_cobranzas.smn_rel_desc_forma_pago
	INNER JOIN
		smn_base.smn_descuentos_retenciones on smn_cobranzas.smn_rel_desc_forma_pago.smn_descuentos_retenciones_rf = smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id
	INNER JOIN 
		smn_base.smn_formas_pago on smn_cobranzas.smn_rel_desc_forma_pago.smn_forma_pago_id = smn_base.smn_formas_pago.smn_formas_pago_id
where
	smn_rel_desc_forma_pago_id = ${fld:id}

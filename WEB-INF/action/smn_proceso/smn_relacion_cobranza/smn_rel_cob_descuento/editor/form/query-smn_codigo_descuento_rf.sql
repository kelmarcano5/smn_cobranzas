select smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id as id, smn_base.smn_descuentos_retenciones.dyr_codigo || ' - ' || smn_base.smn_descuentos_retenciones.dyr_descripcion as item from smn_base.smn_descuentos_retenciones order by smn_base.smn_descuentos_retenciones.dyr_descripcion
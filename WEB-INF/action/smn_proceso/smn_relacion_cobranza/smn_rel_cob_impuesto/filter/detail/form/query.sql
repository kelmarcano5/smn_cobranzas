select
	smn_cobranzas.smn_rel_cob_impuesto.*,
	case
		when smn_cobranzas.smn_rel_cob_impuesto.rci_tipo_movimiento='VA' then '${lbl:b_added_value}'
		when smn_cobranzas.smn_rel_cob_impuesto.rci_tipo_movimiento='RE' then '${lbl:b_retention}'
	end as rci_tipo_movimiento_combo,
	smn_base.smn_codigos_impuestos.imp_codigo ||' - '|| smn_base.smn_codigos_impuestos.imp_descripcion as smn_codigos_impuestos_rf_combo,
	smn_base.smn_monedas.mon_codigo ||' - '|| smn_base.smn_monedas.mon_nombre as smn_moneda_rf_combo,
	smn_base.smn_tasas_de_cambio.tca_fecha_vigencia ||' -> '|| smn_base.smn_tasas_de_cambio.tca_tasa_cambio as smn_tasa_rf_combo
from
	smn_cobranzas.smn_rel_cob_impuesto
inner join
	smn_base.smn_codigos_impuestos on smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id=smn_cobranzas.smn_rel_cob_impuesto.smn_codigos_impuestos_rf
left outer join
	smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id=smn_cobranzas.smn_rel_cob_impuesto.smn_moneda
left outer join
	smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_cobranzas.smn_rel_cob_impuesto.smn_tasa
where
	smn_rel_cob_impuesto_id = ${fld:id}

select
	smn_cobranzas.smn_rel_cob_impuesto.smn_rel_cob_impuesto_id,
	smn_base.smn_codigos_impuestos.imp_codigo ||' - '|| smn_base.smn_codigos_impuestos.imp_descripcion as smn_codigos_impuestos_rf_combo,
	case
		when smn_cobranzas.smn_rel_cob_impuesto.rci_tipo_movimiento='VA' then '${lbl:b_added_value}'
		when smn_cobranzas.smn_rel_cob_impuesto.rci_tipo_movimiento='RE' then '${lbl:b_retention}'
	end as rci_tipo_movimiento,
	smn_cobranzas.smn_rel_cob_impuesto.rci_monto_base,
	smn_cobranzas.smn_rel_cob_impuesto.smn_porcentaje_impuesto_rf,
	smn_cobranzas.smn_rel_cob_impuesto.rci_monto_impuesto_ml,
	smn_cobranzas.smn_rel_cob_impuesto.rci_monto_impuesto_ma,
	smn_cobranzas.smn_rel_cob_impuesto.rci_fecha_registro
from
	smn_cobranzas.smn_rel_cob_impuesto
inner join
	smn_base.smn_codigos_impuestos on smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id=smn_cobranzas.smn_rel_cob_impuesto.smn_codigos_impuestos_rf
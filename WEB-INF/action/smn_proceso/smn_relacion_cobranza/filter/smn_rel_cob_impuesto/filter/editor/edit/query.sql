select	
	smn_cobranzas.smn_rel_cob_impuesto.*,
	case
		when smn_cobranzas.smn_rel_cob_impuesto.rci_tipo_movimiento='VA' then '${lbl:b_added_value}'
		when smn_cobranzas.smn_rel_cob_impuesto.rci_tipo_movimiento='RE' then '${lbl:b_retention}'
	end as rci_tipo_movimiento_combo
from 
	smn_cobranzas.smn_rel_cob_impuesto
where 
	smn_rel_cob_impuesto_id = ${fld:id}



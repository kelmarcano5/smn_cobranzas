select
	case
	when smn_cobranzas.smn_tasas_de_interes.rol_estatus='AC' then '${lbl:b_active}'
	when smn_cobranzas.smn_tasas_de_interes.rol_estatus='IN' then '${lbl:b_inactive}'
	end as rol_estatus_combo,
	smn_cobranzas.smn_tasas_de_interes.*
from
	smn_cobranzas.smn_tasas_de_interes
where
	smn_tasas_de_interes_id = ${fld:id}

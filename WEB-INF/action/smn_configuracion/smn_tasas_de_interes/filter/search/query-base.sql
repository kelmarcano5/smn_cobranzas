select
	case
	when smn_cobranzas.smn_tasas_de_interes.rol_estatus='AC' then '${lbl:b_active}'
	when smn_cobranzas.smn_tasas_de_interes.rol_estatus='IN' then '${lbl:b_inactive}'
	end as rol_estatus_combo,
	smn_cobranzas.smn_tasas_de_interes.tai_codigo,
	smn_cobranzas.smn_tasas_de_interes.tai_descripcion,
	smn_cobranzas.smn_tasas_de_interes.tai_porcentaje,
	smn_cobranzas.smn_tasas_de_interes.rol_estatus,
	smn_cobranzas.smn_tasas_de_interes.rol_vigencia,
	smn_cobranzas.smn_tasas_de_interes.rol_idioma,
	smn_cobranzas.smn_tasas_de_interes.rol_usuario,
	smn_cobranzas.smn_tasas_de_interes.rol_fecha_registro,
	smn_cobranzas.smn_tasas_de_interes.rol_hora,
		smn_cobranzas.smn_tasas_de_interes.smn_tasas_de_interes_id
	
from
	smn_cobranzas.smn_tasas_de_interes
where
	smn_tasas_de_interes_id is not null
	${filter}
order by
		smn_tasas_de_interes_id

select
	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id,
	smn_cobranzas.smn_relacion_cobranza.rco_estatus_proceso as rco_estatus_proceso_pl0,
	smn_cobranzas.smn_reglas_comisiones.smn_reglas_comisiones_id,
	smn_cobranzas.smn_reglas_comisiones.rco_estatus as rco_estatus_pl1,
	smn_cobranzas.smn_rol.smn_rol_id,
	smn_cobranzas.smn_rol.rol_tipo as rol_tipo_pl2,
select
select
select
select
	case
	when smn_cobranzas.smn_rel_comisiones.com_estatus_proceso='GE' then '${lbl:b_generated}'
	when smn_cobranzas.smn_rel_comisiones.com_estatus_proceso='IAP' then '${lbl:b_approved}'
	end as com_estatus_proceso,
	case
	when smn_cobranzas.smn_rel_comisiones.com_estatus_financiero='PE' then '${lbl:b_pending}'
	when smn_cobranzas.smn_rel_comisiones.com_estatus_financiero='IPA' then '${lbl:b_paid}'
	end as com_estatus_financiero,
	smn_cobranzas.smn_rel_comisiones.*
from
	smn_cobranzas.smn_relacion_cobranza,
	smn_cobranzas.smn_reglas_comisiones,
	smn_cobranzas.smn_rol,
	smn_cobranzas.smn_rel_comisiones
where
	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id=smn_cobranzas.smn_rel_comisiones.smn_relacion_cobranza_id and
	smn_cobranzas.smn_reglas_comisiones.smn_reglas_comisiones_id=smn_cobranzas.smn_rel_comisiones.smn_reglas_comisiones_id and
	smn_cobranzas.smn_rol.smn_rol_id=smn_cobranzas.smn_rel_comisiones.smn_rol_id
	and
	smn_rel_comisiones_id = ${fld:id}

select
	smn_cobranzas.smn_relacion_envio_cobranza.*,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf_combo,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_rf_combo,
	case
		when smn_cobranzas.smn_relacion_envio_cobranza.rec_estatus='RE' then '${lbl:b_registered}'
		when smn_cobranzas.smn_relacion_envio_cobranza.rec_estatus='GE' then '${lbl:b_generated}'
		when smn_cobranzas.smn_relacion_envio_cobranza.rec_estatus='EN' then '${lbl:b_delivered}'
	end as rec_estatus_combo
from
	smn_cobranzas.smn_relacion_envio_cobranza
	inner join
	smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id=smn_cobranzas.smn_relacion_envio_cobranza.smn_entidad_rf
	inner join
	smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id=smn_cobranzas.smn_relacion_envio_cobranza.smn_cliente_rf
	inner join
	smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=smn_comercial.smn_cliente.smn_auxiliar_rf
where
	smn_relacion_envio_cobranza_id is not null
	${filter}
order by
		smn_relacion_envio_cobranza_id

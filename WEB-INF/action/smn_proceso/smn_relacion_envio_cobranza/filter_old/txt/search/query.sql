select
		smn_cobranzas.smn_relacion_envio_cobranza.smn_relacion_envio_cobranza_id,
select
		smn_cobranzas.smn_relacion_envio_cobranza.smn_relacion_envio_cobranza_id,
from
	smn_base.smn_entidades
where
select
		smn_cobranzas.smn_relacion_envio_cobranza.smn_relacion_envio_cobranza_id,
		smn_cobranzas.smn_relacion_envio_cobranza.smn_relacion_envio_cobranza_id,
from
	smn_base.smn_sucursales
	smn_base.smn_sucursales
where
select
		smn_cobranzas.smn_relacion_envio_cobranza.smn_relacion_envio_cobranza_id,
		smn_cobranzas.smn_relacion_envio_cobranza.smn_relacion_envio_cobranza_id,
from
	smn_comercial.smn_cliente
	smn_comercial.smn_cliente
	inner join smn_base.smn_auxiliar aux on aux.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	inner join smn_base.smn_auxiliar aux on aux.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
where
	case
	when smn_cobranzas.smn_relacion_envio_cobranza.rec_estatus='RE' then '${lbl:b_registrated}'
	when smn_cobranzas.smn_relacion_envio_cobranza.rec_estatus='GE' then '${lbl:b_generate}'
	when smn_cobranzas.smn_relacion_envio_cobranza.rec_estatus='EN' then '${lbl:b_delivered}'
	end as rec_estatus_combo,
	smn_cobranzas.smn_relacion_envio_cobranza.smn_entidad_rf,
	smn_cobranzas.smn_relacion_envio_cobranza.smn_sucursal_rf,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_numero,
	smn_cobranzas.smn_relacion_envio_cobranza.smn_cliente_rf,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_fecha_generacion,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_ejecutivo_recibe,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_estatus,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_fecha_registro
	
from
	smn_cobranzas.smn_relacion_envio_cobranza
	smn_cobranzas.smn_relacion_envio_cobranza

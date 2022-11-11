select
		smn_cobranzas.smn_relacion_envio_cobranza.smn_relacion_envio_cobranza_id,
	
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
	smn_cobranzas.smn_relacion_envio_cobranza.rec_fecha_registro,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_fecha_entrega,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_monto_ml,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_monto_ma,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_cantidad_documento,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_idioma,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_usuario,
	smn_cobranzas.smn_relacion_envio_cobranza.rec_hora,
	entd.ent_codigo || '-' || entd.ent_descripcion_corta as smn_entidad_rf_combo,
	suc.suc_codigo || '-' || suc.suc_nombre as smn_sucursal_rf_combo,
	aux.aux_codigo || '-' || aux.aux_descripcion as smn_cliente_rf_combo
	
from
	smn_cobranzas.smn_relacion_envio_cobranza
	inner join smn_base.smn_entidades entd on entd.smn_entidades_id = smn_cobranzas.smn_relacion_envio_cobranza.smn_entidad_rf
	left outer join smn_base.smn_sucursales suc on suc.smn_sucursales_id = smn_cobranzas.smn_relacion_envio_cobranza.smn_sucursal_rf
	inner join smn_comercial.smn_cliente client on client.smn_cliente_id = smn_cobranzas.smn_relacion_envio_cobranza.smn_cliente_rf 
	inner join smn_base.smn_auxiliar aux on aux.smn_auxiliar_id = client.smn_auxiliar_rf	

where
	smn_relacion_envio_cobranza_id = ${fld:id}

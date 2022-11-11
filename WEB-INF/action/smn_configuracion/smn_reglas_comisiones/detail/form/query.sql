select
		smn_cobranzas.smn_reglas_comisiones.smn_reglas_comisiones_id,
	case
	when smn_cobranzas.smn_reglas_comisiones.rco_estatus='AC' then '${lbl:b_active}'
	when smn_cobranzas.smn_reglas_comisiones.rco_estatus='IN' then '${lbl:b_inactive}'
	end as rco_estatus,
	smn_cobranzas.smn_tipo_documento.tdo_descripcion as smn_tipo_documento_id,
	smn_cobranzas.smn_documento.doc_descripcion as smn_documento_id,
	smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf,
	smn_base.smn_auxiliar.aux_descripcion smn_auxiliar_rf,
	smn_cobranzas.smn_reglas_comisiones.rco_porcentaje,
	smn_cobranzas.smn_reglas_comisiones.rco_vigencia,
	smn_cobranzas.smn_reglas_comisiones.rco_fecha_registro
	
from
	smn_cobranzas.smn_reglas_comisiones
	inner join smn_cobranzas.smn_documento on smn_cobranzas.smn_documento.smn_documento_id = smn_cobranzas.smn_reglas_comisiones.smn_documento_id
	inner join smn_cobranzas.smn_tipo_documento on smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id = smn_cobranzas.smn_reglas_comisiones.smn_tipo_documento_id
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_cobranzas.smn_reglas_comisiones.smn_clase_auxiliar_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_cobranzas.smn_reglas_comisiones.smn_auxiliar_rf
where
	smn_reglas_comisiones_id = ${fld:id}

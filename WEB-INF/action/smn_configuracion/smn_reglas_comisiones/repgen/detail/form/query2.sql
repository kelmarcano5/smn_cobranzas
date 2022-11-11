select
		smn_cobranzas.smn_reglas_comisiones.smn_tipo_documento_id,
	smn_cobranzas.smn_reglas_comisiones.smn_documento_id,
	smn_cobranzas.smn_reglas_comisiones.smn_clase_auxiliar_rf,
	smn_cobranzas.smn_reglas_comisiones.smn_auxiliar_rf,
	smn_cobranzas.smn_reglas_comisiones.rco_porcentaje,
	smn_cobranzas.smn_reglas_comisiones.rco_estatus,
	smn_cobranzas.smn_reglas_comisiones.rco_vigencia,
	smn_cobranzas.smn_reglas_comisiones.rco_fecha_registro
from
	smn_cobranzas.smn_reglas_comisiones 
where
	smn_cobranzas.smn_reglas_comisiones.smn_reglas_comisiones_id = ${fld:id}

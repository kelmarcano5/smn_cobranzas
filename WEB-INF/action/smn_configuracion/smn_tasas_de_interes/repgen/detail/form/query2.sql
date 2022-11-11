select
		smn_cobranzas.smn_tasas_de_interes.tai_codigo,
	smn_cobranzas.smn_tasas_de_interes.tai_descripcion,
	smn_cobranzas.smn_tasas_de_interes.tai_porcentaje,
	smn_cobranzas.smn_tasas_de_interes.rol_estatus,
	smn_cobranzas.smn_tasas_de_interes.rol_vigencia,
	smn_cobranzas.smn_tasas_de_interes.rol_fecha_registro
from
	smn_cobranzas.smn_tasas_de_interes 
where
	smn_cobranzas.smn_tasas_de_interes.smn_tasas_de_interes_id = ${fld:id}

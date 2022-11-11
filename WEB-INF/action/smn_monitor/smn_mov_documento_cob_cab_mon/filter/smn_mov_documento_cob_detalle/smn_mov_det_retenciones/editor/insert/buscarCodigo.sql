select
		smn_cobranzas.smn_mov_det_retenciones.smn_codigo_impuesto_id
from
		smn_cobranzas.smn_mov_det_retenciones
where
		upper(smn_cobranzas.smn_mov_det_retenciones.smn_codigo_impuesto_id) = upper(${fld:smn_codigo_impuesto_id})

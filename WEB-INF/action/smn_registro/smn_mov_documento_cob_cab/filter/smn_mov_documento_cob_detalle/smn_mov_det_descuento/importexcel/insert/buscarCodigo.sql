select
		smn_cobranzas.smn_mov_det_descuento.smn_codigo_descuento_id
from
		smn_cobranzas.smn_mov_det_descuento
where
		upper(smn_cobranzas.smn_mov_det_descuento.smn_codigo_descuento_id) = upper(${fld:smn_codigo_descuento_id})

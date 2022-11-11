select
		smn_cobranzas.smn_rel_cob_descuento.smn_codigo_descuento_rf
from
		smn_cobranzas.smn_rel_cob_descuento
where
		upper(smn_cobranzas.smn_rel_cob_descuento.smn_codigo_descuento_rf) = upper(${fld:smn_codigo_descuento_rf})

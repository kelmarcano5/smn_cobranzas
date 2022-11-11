select
		smn_cobranzas.smn_rel_cob_impuesto.smn_codigos_impuestos_rf
from
		smn_cobranzas.smn_rel_cob_impuesto
where
		upper(smn_cobranzas.smn_rel_cob_impuesto.smn_codigos_impuestos_rf) = upper(${fld:smn_codigos_impuestos_rf})

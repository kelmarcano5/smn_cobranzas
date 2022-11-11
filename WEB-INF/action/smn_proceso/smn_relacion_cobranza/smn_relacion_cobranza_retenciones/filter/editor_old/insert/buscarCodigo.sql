select
		smn_cobranzas.smn_relacion_cobranza_retenciones.smn_codigo_retenciones_rf
from
		smn_cobranzas.smn_relacion_cobranza_retenciones
where
		upper(smn_cobranzas.smn_relacion_cobranza_retenciones.smn_codigo_retenciones_rf) = upper(${fld:smn_codigo_retenciones_rf})

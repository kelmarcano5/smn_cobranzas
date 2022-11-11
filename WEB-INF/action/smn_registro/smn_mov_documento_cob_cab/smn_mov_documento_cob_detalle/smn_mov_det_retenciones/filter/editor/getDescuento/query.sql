SELECT
	smn_base.smn_codigos_impuestos.imp_porcentaje_base AS base,
	smn_base.smn_codigos_impuestos.imp_porcentaje_calculo AS impuesto
FROM 
	smn_base.smn_codigos_impuestos
where 
    smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id=${fld:id} and 
	smn_base.smn_codigos_impuestos.imp_tipo_codigo = 'RE'

SELECT 
smn_mov_documento_cob_cab_id

from smn_cobranzas.smn_mov_documento_cob_cab 

where smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf=${fld:smn_cliente_rf}
		and mdc_estatus_proceso = 'RE'

UPDATE smn_cobranzas.smn_mov_documento_cob_cab SET
	mdc_estatus_financiero='PA'
WHERE
	smn_mov_documento_cob_cab_id=${fld:smn_mov_documento_cob_cab_id}
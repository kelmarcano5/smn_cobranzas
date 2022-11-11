UPDATE smn_comercial.smn_control_fiscal_documento SET
	cfd_ultimo_numero_fiscal_usado=${fld:fca_numero_control_fiscal}
WHERE
	smn_documento_id=${fld:smn_documento_id_cme}
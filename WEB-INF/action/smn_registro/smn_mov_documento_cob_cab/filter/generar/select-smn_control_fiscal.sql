SELECT
	cfd_ultimo_numero_fiscal_usado+1 AS fca_numero_control_fiscal,
	cfd_serie
FROM
	smn_comercial.smn_control_fiscal_documento
WHERE
	smn_documento_id=${fld:smn_documento_id_cme}
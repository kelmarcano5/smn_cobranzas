SELECT
	smn_base.smn_direccion.dir_descripcion
FROM
	smn_base.smn_direccion
	INNER JOIN
	smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_direccion_id=smn_base.smn_direccion.smn_direccion_id
	INNER JOIN
	smn_base.smn_rel_auxiliar_direccion ON smn_base.smn_rel_auxiliar_direccion.smn_direccion_id=smn_base.smn_auxiliar.smn_direccion_id
WHERE
	smn_base.smn_rel_auxiliar_direccion.rad_tipo_direccion='F'
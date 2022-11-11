INSERT INTO smn_cobranzas.smn_rel_reglas_rol
(
	smn_rel_reglas_rol_id,
	smn_reglas_comisiones_id,
	smn_rol_id
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_rel_reglas_rol},
	${seq:currval@smn_cobranzas.seq_smn_reglas_comisiones},
	${fld:smn_rol_id}
)

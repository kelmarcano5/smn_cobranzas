INSERT INTO smn_cobranzas.smn_rel_cob_documento
(
	smn_rel_cob_documento_id,
	smn_relacion_cobranza_id,
	smn_mov_documento_cob_det_id
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_rel_cob_documento},
	?,
	?
)

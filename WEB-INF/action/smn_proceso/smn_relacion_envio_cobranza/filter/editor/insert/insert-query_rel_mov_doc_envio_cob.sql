INSERT INTO smn_cobranzas.smn_rel_relacion_envio_documento
(
	smn_rel_relacion_envio_documento_id,
  smn_relacion_envio_cobranza_id,
  smn_mov_documento_cob_cab_id
)
VALUES
(
	${seq:nextval@smn_cobranzas.seq_smn_rel_relacion_envio_documento},
	${seq:currval@smn_cobranzas.seq_smn_relacion_envio_cobranza},
	${fld:smn_mov_documento_cob_cab_id}
)

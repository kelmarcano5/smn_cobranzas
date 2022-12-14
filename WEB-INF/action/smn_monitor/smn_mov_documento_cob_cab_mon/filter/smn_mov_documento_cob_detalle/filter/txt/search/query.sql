select
		smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_detalle_id,
	smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id,
	smn_cobranzas.smn_tipo_documento.tdo_codigo as tdo_codigo_pl0,
	smn_cobranzas.smn_documento.smn_documento_id,
	smn_cobranzas.smn_documento.doc_codigo as doc_codigo_pl1,
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_tipo_documento_id,
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_documento_id,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_numero_documento,
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_cliente_rf,
	smn_cobranzas.smn_mov_documento_cob_detalle.smn_centro_costo_rf,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_monto_ml,
	smn_cobranzas.smn_mov_documento_cob_detalle.mdd_fecha_registro
	
from
	smn_cobranzas.smn_tipo_documento,
	smn_cobranzas.smn_documento,
	smn_cobranzas.smn_mov_documento_cob_detalle
where
	smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_tipo_documento_id and
	smn_cobranzas.smn_documento.smn_documento_id=smn_cobranzas.smn_mov_documento_cob_detalle.smn_documento_id

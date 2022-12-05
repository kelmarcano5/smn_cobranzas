UPDATE smn_comercial.smn_factura_cabecera SET
	fca_estatus_proceso= 'RV',
	fca_estatus_financiero= 'PA',
	fca_fecha_anulacion= {d '${def:date}'},
	fca_motivo_anulacion=(SELECT smn_cobranzas.smn_motivo_anulacion.smn_descripcion 
							FROM smn_cobranzas.smn_motivo_anulacion 
							WHERE smn_cobranzas.smn_motivo_anulacion.smn_motivo_anulacion_id=${fld:mdd_motivo_nota_rf}),
	
	smn_pedido_original=(SELECT smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen 
							FROM smn_cobranzas.smn_mov_documento_cob_cab
							WHERE smn_mov_documento_cob_cab_id=${fld:id2}),
	fca_usuario_anulacion='${def:user}',
	fca_idioma='${def:locale}',
	fca_fecha_registro={d '${def:date}'},
	fca_hora='${def:time}'
WHERE
	fca_numero_documento=${fld:mdc_numero_factura};


UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_estatus= 'PR',	
	pca_status_proceso='RV',
	pca_idioma='${def:locale}',
	pca_fecha_registro={d '${def:date}'},
	pca_hora='${def:time}'
WHERE
	smn_pedido_cabecera_id=(SELECT smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id 
							FROM
								smn_comercial.smn_pedido_cabecera

								INNER JOIN smn_cobranzas.smn_mov_documento_cob_cab

									ON smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen = smn_comercial.smn_pedido_cabecera.pca_numero_pedido
							WHERE smn_mov_documento_cob_cab_id=${fld:id2});
							

UPDATE smn_comercial.smn_rel_pedido_factura SET 
	rpf_estatus='AN',
	rpf_usuario='${def:user}',
	rpf_idioma='${def:locale}',
	rpf_fecha_registro={d '${def:date}'},
	rpf_hora='${def:time}'
	
WHERE
	smn_comercial.smn_rel_pedido_factura.smn_rel_pedido_factura_id=(SELECT smn_comercial.smn_rel_pedido_factura.smn_rel_pedido_factura_id
									FROM smn_comercial.smn_rel_pedido_factura INNER JOIN smn_comercial.smn_factura_cabecera 
										ON smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id=smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id
									WHERE
										smn_comercial.smn_factura_cabecera.fca_numero_documento=${fld:mdc_numero_factura});


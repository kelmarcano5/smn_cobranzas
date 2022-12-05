  SELECT DISTINCT cl.aux_razon_social as cliente,
     smn_comercial.smn_documento.dcf_descripcion as doc_descripcion,
     smn_comercial.smn_factura_cabecera.fca_numero_control_fiscal as control_fiscal,
     cl.aux_rif as rif,
     smn_comercial.smn_factura_cabecera.smn_documento_id as nro_doc,
     smn_comercial.smn_factura_cabecera.fca_estatus_financiero,
     smn_comercial.smn_factura_cabecera.fca_fecha_registro as fecha_documento,
     smn_base.smn_direccion.dir_descripcion as direccion,
     smn_comercial.smn_factura_cabecera.fca_numero_documento,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_numero_documento,
     smn_cobranzas.smn_mov_documento_cob_detalle.mdd_control_fiscal,
    smn_cobranzas.smn_mov_documento_cob_detalle.mdd_fecha_pago,
    smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_factura,
    paciente.aux_num_doc_oficial as cedula,
    paciente.aux_descripcion as paciente,
    paciente.aux_direccion_rf as direccion_paciente
    
 FROM

    smn_cobranzas.smn_mov_documento_cob_detalle
        INNER JOIN smn_cobranzas.smn_mov_documento_cob_cab ON 
        smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id = smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id
        
        INNER JOIN smn_cobranzas.smn_tipo_documento ON 
        smn_cobranzas.smn_tipo_documento.smn_tipo_documento_id = smn_cobranzas.smn_mov_documento_cob_detalle.smn_tipo_documento_id
        
        INNER JOIN smn_comercial.smn_factura_cabecera ON 
        smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_factura = smn_comercial.smn_factura_cabecera.fca_numero_documento
        
     inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_factura_cabecera.smn_cliente_id
     inner join smn_base.smn_auxiliar cl on cl.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
     left join smn_base.smn_direccion ON smn_base.smn_direccion.smn_direccion_id = cl.aux_direccion_rf
     inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_factura_cabecera.smn_documento_id
     inner join smn_comercial.smn_rel_pedido_factura rel_pedido ON rel_pedido.smn_factura_cabecera_id = smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id
     inner join smn_comercial.smn_pedido_cabecera pedido ON pedido.smn_pedido_cabecera_id = rel_pedido.smn_pedido_cabecera_id
     inner join smn_base.smn_auxiliar paciente on paciente.smn_auxiliar_id = pedido.smn_auxiliar_rf 
 WHERE
     smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_det_id=${fld:smn_mov_documento_cob_det_id}

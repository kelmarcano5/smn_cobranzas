CREATE TABLE smn_tipo_documento(
  smn_tipo_documento_id INTEGER NOT NULL,
  tdo_codigo CHARACTER(16) NOT NULL,
  tdo_descripcion VARCHAR(64) NOT NULL,
  tdo_tipo_movimiento CHARACTER(2) NOT NULL,
  tdo_estatus CHARACTER(2) NOT NULL,
  tdo_vigencia DATE NOT NULL,
  tdo_idioma CHARACTER(2) NOT NULL,
  tdo_usuario VARCHAR(10) NOT NULL,
  tdo_fecha_registro DATE NOT NULL,
  tdo_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_cobranzas.seq_smn_tipo_documento;


CREATE TABLE smn_rel_cob_documento(
  smn_rel_cob_documento_id INTEGER NOT NULL,
  smn_relacion_cobranza_id INTEGER NOT NULL,
  smn_mov_documento_cob_det_id INTEGER NOT NULL
);

CREATE SEQUENCE smn_cobranzas.seq_smn_rel_cob_documento;


CREATE TABLE smn_rel_cob_impuesto(
  smn_rel_cob_impuesto_id INTEGER NOT NULL,
  smn_relacion_cobranza_id INTEGER NOT NULL,
  smn_codigos_impuestos_rf INTEGER,
  rci_monto_base DOUBLE PRECISION NOT NULL,
  smn_porcentaje_impuesto_rf INTEGER,
  rci_sustraendo_rf DOUBLE PRECISION,
  rci_tipo_movimiento CHARACTER(2) NOT NULL,
  rci_monto_impuesto_ml DOUBLE PRECISION NOT NULL,
  smn_moneda INTEGER,
  smn_tasa INTEGER,
  rci_monto_impuesto_ma DOUBLE PRECISION,
  rci_idioma CHARACTER(2) NOT NULL,
  rci_usuario VARCHAR(10) NOT NULL,
  rci_fecha_registro DATE NOT NULL,
  rci_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_cobranzas.seq_smn_rel_cob_impuesto;


CREATE TABLE smn_saldo_cliente(
  smn_saldo_cliente_id INTEGER NOT NULL,
  smn_entidad_rf INTEGER NOT NULL,
  smn_sucursal_rf INTEGER,
  smn_cliente_rf INTEGER NOT NULL,
  scl_fecha DATE NOT NULL,
  scl_saldo_inicial_ml DOUBLE PRECISION NOT NULL,
  scl_debitos_ml DOUBLE PRECISION NOT NULL,
  scl_creditos_ml DOUBLE PRECISION NOT NULL,
  scl_saldo_final_ml DOUBLE PRECISION NOT NULL,
  scl_saldo_inicial_ma DOUBLE PRECISION NOT NULL,
  scl_debitos_ma DOUBLE PRECISION NOT NULL,
  scl_creditos_ma DOUBLE PRECISION NOT NULL,
  scl_saldo_final_ma DOUBLE PRECISION NOT NULL,
  scl_saldo_vencido_ml DOUBLE PRECISION NOT NULL,
  scl_saldo_vencido_ma DOUBLE PRECISION NOT NULL,
  scl_estatus CHARACTER(2) NOT NULL,
  scl_porcentaje_deuda_vencida DOUBLE PRECISION NOT NULL,
  scl_idioma CHARACTER(2) NOT NULL,
  scl_usuario VARCHAR(10) NOT NULL,
  scl_fecha_registro DATE NOT NULL,
  scl_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_cobranzas.seq_smn_saldo_cliente;


CREATE TABLE smn_rel_desc_forma_pago(
  smn_rel_desc_forma_pago_id INTEGER NOT NULL,
  smn_descuentos_retenciones_rf INTEGER NOT NULL,
  smn_forma_pago_id INTEGER NOT NULL,
  rdf_estatus CHARACTER(2) NOT NULL,
  rdf_idioma CHARACTER(2) NOT NULL,
  rdf_usuario VARCHAR(10) NOT NULL,
  rdf_fecha_registro DATE NOT NULL,
  rdf_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_cobranzas.seq_smn_rel_desc_forma_pago;


CREATE TABLE smn_centro_cobranza(
  smn_centro_cobranza_id INTEGER NOT NULL,
  cco_codigo CHARACTER(16) NOT NULL,
  cco_descripcion VARCHAR(64) NOT NULL,
  smn_rol_id INTEGER NOT NULL,
  smn_auxiliar_id INTEGER NOT NULL,
  rol_estatus CHARACTER(2) NOT NULL,
  rol_idioma CHARACTER(2) NOT NULL,
  rol_usuario VARCHAR(10) NOT NULL,
  rol_fecha_registro DATE NOT NULL,
  rol_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_cobranzas.seq_smn_centro_cobranza;


CREATE TABLE smn_relacion_envio_cobranza(
  smn_relacion_envio_cobranza_id INTEGER NOT NULL,
  smn_entidad_rf INTEGER NOT NULL,
  smn_sucursal_rf INTEGER,
  rec_numero INTEGER NOT NULL,
  smn_cliente_rf INTEGER NOT NULL,
  rec_fecha_generacion DATE NOT NULL,
  rec_fecha_entrega DATE NOT NULL,
  rec_ejecutivo_recibe CHARACTER(2) NOT NULL,
  rec_monto_ml DOUBLE PRECISION NOT NULL,
  rec_monto_ma DOUBLE PRECISION,
  rec_cantidad_documento INTEGER NOT NULL,
  rec_estatus CHARACTER(2) NOT NULL,
  rec_idioma CHARACTER(2) NOT NULL,
  rec_usuario VARCHAR(10) NOT NULL,
  rec_fecha_registro DATE NOT NULL,
  rec_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_cobranzas.seq_smn_relacion_envio_cobranza;



ALTER TABLE smn_tipo_documento ADD PRIMARY KEY (smn_tipo_documento_id);

ALTER TABLE smn_rel_cob_documento ADD PRIMARY KEY (smn_rel_cob_documento_id);

ALTER TABLE smn_rel_cob_impuesto ADD PRIMARY KEY (smn_rel_cob_impuesto_id);

ALTER TABLE smn_saldo_cliente ADD PRIMARY KEY (smn_saldo_cliente_id);

ALTER TABLE smn_rel_desc_forma_pago ADD PRIMARY KEY (smn_rel_desc_forma_pago_id);

ALTER TABLE smn_centro_cobranza ADD PRIMARY KEY (smn_centro_cobranza_id);

ALTER TABLE smn_relacion_envio_cobranza ADD PRIMARY KEY (smn_relacion_envio_cobranza_id);


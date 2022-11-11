select
	case
	when smn_cobranzas.smn_tipo_documento.tdo_tipo_movimiento='RC' then '${lbl:b_collections_relationship}'
	when smn_cobranzas.smn_tipo_documento.tdo_tipo_movimiento='ND' then '${lbl:b_debit_note}'
	when smn_cobranzas.smn_tipo_documento.tdo_tipo_movimiento='NC' then '${lbl:b_credit_note}'
	when smn_cobranzas.smn_tipo_documento.tdo_tipo_movimiento='FC' then '${lbl:b_bill}'
	end as tdo_tipo_movimiento_combo,
	case
	when smn_cobranzas.smn_tipo_documento.tdo_estatus='AC' then '${lbl:b_active}'
	when smn_cobranzas.smn_tipo_documento.tdo_estatus='IN' then '${lbl:b_inactive}'
	end as tdo_estatus_combo,
	smn_cobranzas.smn_tipo_documento.*
from
	smn_cobranzas.smn_tipo_documento
where
	smn_tipo_documento_id = ${fld:id}

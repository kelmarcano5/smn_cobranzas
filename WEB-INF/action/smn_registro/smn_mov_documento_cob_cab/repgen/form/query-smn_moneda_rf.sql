select smn_base.smn_monedas.smn_monedas_id as id, smn_base.smn_monedas.mon_codigo|| ' - ' || smn_base.smn_monedas.mon_nombre as item from smn_base.smn_monedas order by smn_base.smn_monedas.mon_nombre
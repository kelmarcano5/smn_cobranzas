SELECT 
    smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id AS id, 
    smn_monedas1.mon_nombre ||' - '|| smn_monedas2.mon_nombre ||' - '|| smn_base.smn_tasas_de_cambio.tca_fecha_vigencia ||' - '|| smn_base.smn_tasas_de_cambio.tca_tasa_cambio AS item 
FROM 
    smn_base.smn_tasas_de_cambio	
    INNER JOIN smn_base.smn_monedas AS smn_monedas1 ON smn_monedas1.smn_monedas_id = smn_base.smn_tasas_de_cambio.smn_monedas_id 
    INNER JOIN smn_base.smn_monedas AS smn_monedas2 ON smn_monedas2.smn_monedas_id = smn_base.smn_tasas_de_cambio.tca_moneda_referencia
select 
    smn_base.smn_tasas_de_cambio.tca_tasa_cambio as tasa
from 
    smn_base.smn_tasas_de_cambio 
where 
    smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=${fld:id}
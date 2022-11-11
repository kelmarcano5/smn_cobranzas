select 
    smn_base.smn_descuentos_retenciones.dyr_porcentaje_base as base, 
    smn_base.smn_descuentos_retenciones.dyr_porcentaje_descuento as descporc 
from 
    smn_base.smn_descuentos_retenciones 
where 
    smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id=${fld:id}

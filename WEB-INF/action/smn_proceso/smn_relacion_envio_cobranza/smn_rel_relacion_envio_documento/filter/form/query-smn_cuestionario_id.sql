select smn_base.smn_cuestionario.smn_cuestionario_id as id, 
		smn_base.smn_cuestionario.cue_codigo|| ' - ' || smn_base.smn_cuestionario.cue_descripcion 
		as item from smn_base.smn_cuestionario
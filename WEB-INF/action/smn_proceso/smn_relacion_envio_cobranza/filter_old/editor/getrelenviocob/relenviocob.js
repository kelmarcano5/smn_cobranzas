listboxClear("smn_relacion_envio_cobranza_id");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_relacion_envio_cobranza_id.add(optionChoose, 0);

<smn_relacion_envio_cobranza_id_rows>
	var option = document.createElement("option");
	option.text = "${fld:id@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_relacion_envio_cobranza_id.add(option, 0);
</smn_relacion_envio_cobranza_id_rows>

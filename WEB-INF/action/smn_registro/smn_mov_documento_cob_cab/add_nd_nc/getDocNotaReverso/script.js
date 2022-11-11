if('${fld:nota_reverso}'=='SI'){
	console.log('si es nota reverso');
	var cc = $('#smn_centro_costo_rf').val();
	var sl = $('#mdc_saldo_doc_ml').val();
	var sa = $('#mdc_saldo_doc_ma').val();


	$('#porcentaje_descuento').val(0);
	$('#mdd_monto_ml').val(sl);
	$('#mdd_monto_ma').val(sa);


	$('#porcentaje_descuento').prop('disabled','true');
	$('#mdd_monto_ml').prop('disabled','true');
	$('#mdd_monto_ma').prop('disabled','true');
	$('#smn_centro_costo_rf').prop('disabled','true');




}

$(function() {

$("select,#kaiinnkakaku").change(function() {

	var hairetu = [];
	for(var i = 0; i < $(".buy_itemu_menu").length; i++){

		var item_price = $(".buy_itemu_menu").eq(i).data("price");
		var item_select = $(".buy_itemu_menu").eq(i).next("select").find("option:selected").data("num");



			hairetu.push(item_price * item_select);
	}

	var total = 0;
	for(var j = 0; j < hairetu.length; j++){
		total += hairetu[j];
	}




	$("#item_price_total").val(total + "円");


});

});

function changeDeal(){
	value = $("campaign_kind").getValue();
	if (value == "Text Club") {
		$("offer_div").innerHTML = "Join the text club for <input type=\"text\" size=\"15\" name=\"campaign[offer]\" id=\"campaign_offer\" class=\"large_form\">";
	}
	else if (value == "Discount/Coupon") {
		$("offer_div").innerHTML = "Text to get a discount on <input type=\"text\" size=\"15\" name=\"campaign[offer]\" id=\"campaign_offer\" class=\"large_form\">";
	}
	else if (value == "Enter to Win") {
		$("offer_div").innerHTML = "Enter to win <input type=\"text\" size=\"15\" name=\"campaign[offer]\" id=\"campaign_offer\" class=\"large_form\">";
	}
};

document.observe('dom:loaded', function() {
	$("campaign_kind").observe('change', changeDeal);
});

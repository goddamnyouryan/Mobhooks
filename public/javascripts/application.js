// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

	document.observe('dom:loaded', function() {
	
		new Tip('business_name_tooltip', "Complete name of the business that is offering this text (SMS) coupon, contest or club.", {title: 'Business Name', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('business_type_tooltip', "<strong>Local:</strong> This is an entity that you believe has one or more locations serving your city or region only. If you know they have locations in other regions or states, please choose National Chain. <br /><br /> <strong>National Chain:</strong> Any business that has numerous locations in multiple cities, regions, and states. Examples include McDonalds, Starbucks, 7-11, Subway, etc. <br /><br /> <strong>National Brand/Non-Chain:</strong> Well known brands or companies that do not have specific locations that consumers actually visit to make purchases.  Ex: Fox News, The Weather Channel, Coke, Pepsi, Cheerios, etc.", {title: 'Business Type', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('offer_tooltip', "This should say exactly what people will receive for opting in for this campaign. Ex: Get 10% off purchase, Enter to win a $1000, or join text club.", {title: 'Offer', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('shortcode_tooltip', "This is the 5 or 6 digit code that you must text to in order to get the offer. Ex: 41027, 640640, etc.", {title: 'Shortcode', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('keyword_tooltip', "This is the SPECIFIC word, words, or other info that must be texted to the shortcode to get the offer. Ex: DEAL, JOIN, etc. NOTE: sometimes businesses want you to text your email to their shortcode. If so, simply use “Your email” as the keyword.", {title: 'Keyword', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('tags_tooltip', "Tags are words that describe the business or offer. Sort of like categories. Think of one or more words that you would use as a search term if you were trying to find this business or offer. Please enter 2 or more.", {title: 'Tags', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('offer_details_tooltip', "Any specific information that would be more helpful in explaining this business or offer to someone. Are there any restrictions, expirations dates, or other fine print? Ex: 'offer expires xx/xx/xxxx' or  'Chuck E-Club benefits include exclusive monthly coupons, 20 free tokens on your child's birthday, kids activities and more.'", {title: 'Offer Details', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('campaign_photo_tooltip', "Upload a photo that pertains to this campaign. It will be resized to: 540x200px. Otherwise a default image will be displayed", {title: 'Upload Campaign Photo', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });

		});

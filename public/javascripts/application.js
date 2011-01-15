// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

	document.observe('dom:loaded', function() {
	
		new Tip('business_name_tooltip', "The name of the business that is offering this SMS campaign. If this business has already been entered into Mobhooks database, this field will attempt to autocomplete the business name.", {title: 'Business Name', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('offer_tooltip', "What is the deal that you get when you partake in this SMS campaign? Why should people participate? What do they get for entering?", {title: 'Offer', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('shortcode_tooltip', "The SMS shortcode that people have to text to get the offer. ex: '12345'", {title: 'Shortcode', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('keyword_tooltip', "The word that people have to text the above shortcode to get the offer. ex: 'DEAL'", {title: 'Keyword', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('tags_tooltip', "Tags are keywords that describe the campaign. Think of them as categories. They are also used as search criteria.", {title: 'Tags', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('offer_details_tooltip', "Go into more detail about the SMS campaign being offered. Are there any terms? Fine Print?", {title: 'Offer Details', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });
		new Tip('campaign_photo_tooltip', "Upload a photo that pertains to this campaign. It will be resized to: 540x200px. Otherwise a default image will be displayed", {title: 'Upload Campaign Photo', className: 'pinktip', hook:{target: 'topRight', tip: 'bottomLeft'} });

		});

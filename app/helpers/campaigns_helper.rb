module CampaignsHelper
  
  def thumbnail(campaign)
    if campaign.tag_list.include?("music") || campaign.tag_list.include?("movies") || campaign.tag_list.include?("film")  || campaign.tag_list.include?("tv") || campaign.tag_list.include?("show") || campaign.tag_list.include?("theater")
      image_tag "campaigns/showbiz.png"
    elsif campaign.tag_list.include?("local")  || campaign.tag_list.include?("fair") || campaign.tag_list.include?("carnival") || campaign.tag_list.include?("museum") || campaign.tag_list.include?("theme park") || campaign.tag_list.include?("park")
      image_tag "campaigns/street.png"
    elsif campaign.tag_list.include?("subway") || campaign.tag_list.include?("bus") || campaign.tag_list.include?("water") || campaign.tag_list.include?("gas") || campaign.tag_list.include?("electric") || campaign.tag_list.include?("power")
      image_tag "campaigns/teamster.png"
    elsif campaign.tag_list.include?("school") || campaign.tag_list.include?("univsersity") || campaign.tag_list.include?("education") || campaign.tag_list.include?("training") || campaign.tag_list.include?("class") || campaign.tag_list.include?("books") || campaign.tag_list.include?("university") || campaign.tag_list.include?("college")
      image_tag "campaigns/wiseguy.png"
    elsif campaign.tag_list.include?("hotel") || campaign.tag_list.include?("motel") || campaign.tag_list.include?("travel") || campaign.tag_list.include?("vacation") || campaign.tag_list.include?("airline") || campaign.tag_list.include?("flight") || campaign.tag_list.include?("car rental") || campaign.tag_list.include?("rental")
      image_tag "campaigns/witnessprotection.png"
    elsif campaign.tag_list.include?("pets") || campaign.tag_list.include?("animals") || campaign.tag_list.include?("farm") || campaign.tag_list.include?("dogs") || campaign.tag_list.include?("cats") || campaign.tag_list.include?("health") || campaign.tag_list.include?("pet") || campaign.tag_list.include?("animal") || campaign.tag_list.include?("dog") || campaign.tag_list.include?("cat") || campaign.tag_list.include?("bird") || campaign.tag_list.include?("fish")  || campaign.tag_list.include?("pet store")
      image_tag "campaigns/animali.png"
    elsif campaign.tag_list.include?("sports") || campaign.tag_list.include?("arena") || campaign.tag_list.include?("baseball") || campaign.tag_list.include?("basketball") || campaign.tag_list.include?("football") || campaign.tag_list.include?("soccer") || campaign.tag_list.include?("hockey") || campaign.tag_list.include?("bowling") || campaign.tag_list.include?("tennis") || campaign.tag_list.include?("track") || campaign.tag_list.include?("lacrosse")
      image_tag "campaigns/ballz.png"
    elsif campaign.tag_list.include?("beauty") || campaign.tag_list.include?("spa") || campaign.tag_list.include?("salon") || campaign.tag_list.include?("barber") || campaign.tag_list.include?("facial") || campaign.tag_list.include?("waxing") || campaign.tag_list.include?("manicure") || campaign.tag_list.include?("pedicure") || campaign.tag_list.include?("massage")
      image_tag "campaigns/bellezza.png"
    elsif campaign.tag_list.include?("casino") || campaign.tag_list.include?("gambling")
      image_tag "campaigns/bookie.png"
    elsif campaign.tag_list.include?("bar") || campaign.tag_list.include?("club")|| campaign.tag_list.include?("lounge") || campaign.tag_list.include?("nightlife")
      image_tag "campaigns/bootleg.png"
    elsif campaign.tag_list.include?("law") ||  campaign.tag_list.include?("political") || campaign.tag_list.include?("politics") || campaign.tag_list.include?("government") || campaign.tag_list.include?("campaign") || campaign.tag_list.include?("president")|| campaign.tag_list.include?("senator") || campaign.tag_list.include?("congress")
      image_tag "campaigns/bribe.png"
    elsif campaign.tag_list.include?("media") || campaign.tag_list.include?("station") || campaign.tag_list.include?("radio station") || campaign.tag_list.include?("radio") || campaign.tag_list.include?("tv station") || campaign.tag_list.include?("newspaper") || campaign.tag_list.include?("internet") || campaign.tag_list.include?("magazine") || campaign.tag_list.include?("broadcast")
      image_tag "campaigns/canary.png"
    elsif campaign.tag_list.include?("house") || campaign.tag_list.include?("real estate") || campaign.tag_list.include?("apartment") || campaign.tag_list.include?("rent") || campaign.tag_list.include?("property")
      image_tag "campaigns/casa.png"
    elsif campaign.tag_list.include?("charity") || campaign.tag_list.include?("non-profit") || campaign.tag_list.include?("church") || campaign.tag_list.include?("temple") || campaign.tag_list.include?("religion")
      image_tag "campaigns/charity.png"
    elsif campaign.tag_list.include?("car") || campaign.tag_list.include?("automotive") || campaign.tag_list.include?("auto") || campaign.tag_list.include?("dealership") || campaign.tag_list.include?("mechanic") || campaign.tag_list.include?("dealer") || campaign.tag_list.include?("oil change") || campaign.tag_list.include?("tires") || campaign.tag_list.include?("brakes")
      image_tag "campaigns/chopshop.png"
    elsif campaign.tag_list.include?("clothes") || campaign.tag_list.include?("fashion") || campaign.tag_list.include?("apparel") || campaign.tag_list.include?("jewelry") || campaign.tag_list.include?("style") || campaign.tag_list.include?("department store") || campaign.tag_list.include?("mall") || campaign.tag_list.include?("strip mall")
      image_tag "campaigns/dapper.png"
    elsif campaign.tag_list.include?("coke") || campaign.tag_list.include?("mcdonalds") || campaign.tag_list.include?("pepsi")
      image_tag "campaigns/fatico.png"
    elsif campaign.tag_list.include?("home") || campaign.tag_list.include?("garden") || campaign.tag_list.include?("lawn") || campaign.tag_list.include?("landscape") || campaign.tag_list.include?("landscaping")
      image_tag "campaigns/giardino.png"
    elsif campaign.tag_list.include?("bank") || campaign.tag_list.include?("finance")  || campaign.tag_list.include?("401K") || campaign.tag_list.include?("loan") || campaign.tag_list.include?("annuity") || campaign.tag_list.include?("living trust")
      image_tag "campaigns/heist.png"
    elsif campaign.tag_list.include?("pharmacy") || campaign.tag_list.include?("drugs") || campaign.tag_list.include?("pharmaceutical") || campaign.tag_list.include?("doctor") || campaign.tag_list.include?("medical") || campaign.tag_list.include?("hospital") || campaign.tag_list.include?("health") || campaign.tag_list.include?("nursing") || campaign.tag_list.include?("nursing home") || campaign.tag_list.include?("assisted living") || campaign.tag_list.include?("home health") || campaign.tag_list.include?("nurse")
      image_tag "campaigns/medico.png"
    elsif campaign.tag_list.include?("gym") || campaign.tag_list.include?("fitness") || campaign.tag_list.include?("yoga") || campaign.tag_list.include?("exercise") || campaign.tag_list.include?("workout") || campaign.tag_list.include?("pilates") || campaign.tag_list.include?("trainer")
      image_tag "campaigns/muscle.png"
    elsif campaign.tag_list.include?("professional") || campaign.tag_list.include?("legal") || campaign.tag_list.include?("lawyer") || campaign.tag_list.include?("notary") || campaign.tag_list.include?("accountant") || campaign.tag_list.include?("electrician") || campaign.tag_list.include?("plumber") || campaign.tag_list.include?("contractor") || campaign.tag_list.include?("builder") || campaign.tag_list.include?("handyman") || campaign.tag_list.include?("tax") || campaign.tag_list.include?("accounting")
      image_tag "campaigns/rat.png"
    elsif campaign.tag_list.include?("food") || campaign.tag_list.include?("restaurant") || campaign.tag_list.include?("diner") || campaign.tag_list.include?("dinner") || campaign.tag_list.include?("supper") || campaign.tag_list.include?("lunch") || campaign.tag_list.include?("brunch") || campaign.tag_list.include?("breakfast") || campaign.tag_list.include?("deli")
      image_tag "campaigns/shakedown.png"
    else
      image_tag "campaigns/thumb_missing.png"
    end
  end
    
end

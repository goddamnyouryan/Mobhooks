module CampaignsHelper
  
  def thumbnail(campaign)
    if campaign.tag_list.include?("music" || "movies" || "film" || "tv" || "show" || "theater")
      image_tag "campaigns/showbiz.png"
    elsif campaign.tag_list.include?("local" || "fair" || "carnival" || "museum" || "theme park"|| "park")
      image_tag "campaigns/street.png"
    elsif campaign.tag_list.include?("subway" || "bus" || "water" || "gas" || "electric" || "power")
      image_tag "campaigns/teamster.png"
    elsif campaign.tag_list.include?("school" || "univsersity" || "education" || "training" || "class" || "books" || "university" || "college")
      image_tag "campaigns/wiseguy.png"
    elsif campaign.tag_list.include?("hotel" || "motel" || "travel" || "vacation" || "airline" || "flight" || "car rental" || "rental")
      image_tag "campaigns/witnessprotection.png"
    elsif campaign.tag_list.include?("pets" || "animals" || "farm" || "dogs" ||"cats" || "pet" || "animal" || "dog" || "cat" || "bird" || "fish" || "pet store")
      image_tag "campaigns/animali.png"
    elsif campaign.tag_list.include?("sports" || "arena" || "baseball" || "basketball" || "football" || "soccer" || "hockey" || "bowling" || "tennis" || "track" || "lacrosse")
      image_tag "campaigns/ballz.png"
    elsif campaign.tag_list.include?("beauty" || "spa" || "salon" || "barber" || "facial" || "waxing" || "manicure" || "pedicure" || "massage")
      image_tag "campaigns/bellezza.png"
    elsif campaign.tag_list.include?("casino" || "gambling")
      image_tag "campaigns/bookie.png"
    elsif campaign.tag_list.include?("bar" || "club"|| "lounge" || "nightlife")
      image_tag "campaigns/bootleg.png"
    elsif campaign.tag_list.include?("law" ||  "political" || "politics" || "government" || "campaign" || "president"|| "senator" || "congress")
      image_tag "campaigns/bribe.png"
    elsif campaign.tag_list.include?("media" || "station" || "radio station" || "radio" || "tv station" || "newspaper" || "internet" || "magazine" || "broadcast")
      image_tag "campaigns/canary.png"
    elsif campaign.tag_list.include?("house" || "real estate" || "apartment" || "rent" || "property")
      image_tag "campaigns/casa.png"
    elsif campaign.tag_list.include?("charity" || "non-profit" || "church" || "temple" || "religion")
      image_tag "campaigns/charity.png"
    elsif campaign.tag_list.include?("car" || "automotive" || "auto" || "dealership" || "mechanic" || "dealer" || "oil change" || "tires" || "brakes")
      image_tag "campaigns/chopshop.png"
    elsif campaign.tag_list.include?("clothes" || "fashion" || "apparel" || "jewelry" || "style" || "department store" || "mall" || "strip mall")
      image_tag "campaigns/dapper.png"
    elsif campaign.tag_list.include?("coke" || "mcdonalds" || "pepsi")
      image_tag "campaigns/fatico.png"
    elsif campaign.tag_list.include?("home" || "garden" || "lawn" || "landscape" || "landscaping")
      image_tag "campaigns/giardino.png"
    elsif campaign.tag_list.include?("bank" || "finance"  || "401K" || "loan" || "annuity" || "living trust")
      image_tag "campaigns/heist.png"
    elsif campaign.tag_list.include?("pharmacy" || "drugs" || "pharmaceutical" || "doctor" || "medical" || "hospital" || "health" || "nursing" || "nursing home" || "assisted living" || "home health" || "nurse")
      image_tag "campaigns/medico.png"
    elsif campaign.tag_list.include?("gym" || "fitness" || "yoga" || "exercise" || "workout" || "pilates" || "trainer")
      image_tag "campaigns/muscle.png"
    elsif campaign.tag_list.include?("professional" || "legal" || "lawyer" || "notary" || "accountant" || "electrician" || "plumber" || "contractor" || "builder" || "handyman" || "tax" || "accounting")
      image_tag "campaigns/rat.png"
    else
      image_tag "thumb_missing.png"
    end
  end
    
end

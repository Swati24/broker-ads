class FacebookAds::Campaign < FacebookAds::Base


  def payload
    {
      name: name,
      objective: "LINK_CLICKS",
      status: "ACTIVE"
    }
  end


  def name
    "API TEST 3 - FInal"
  end


  def action
    "act_#{account_id}/campaigns"
  end


  def save_data

  end






end

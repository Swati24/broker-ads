class FacebookAds::Base

  def post
    Rest::Client.post(url, query)
  end

  def payload

  end

  def action

  end


  def base_url
    "https://graph.facebook.com/v2.12"
  end

  def url
    "#{base_url}/#{action}"
  end

end





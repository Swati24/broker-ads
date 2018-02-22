class FacebookAds::Base

  ACCOUNT_ID = '24237132'

  def post
    Rest::Client.post(url, query)
  end

  def get
    Rest::Client.get(url, payload)
  end

  def payload
    { "access_token": "EAASZAlYctZB1ABAAlnZC1GZCLkPzRv1H0pz5yyC9QZBZBRfctDYB7EFUzvHSCbSWPDAtwZCFmGmomuQyhi9Ja2Vj3xog6ZCKpH3dmj8Qguv2QsD5esrEbmJz6bWZCWuR02qwIJmgZB9zel5zWzwMmsypc8FBob4hoWGXvOgeSMX7QdrQZDZD" }
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





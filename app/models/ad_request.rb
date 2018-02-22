class AdRequest < ActiveRecord::Base


  ACCESS_TOKEN = "EAASZAlYctZB1ABAAlnZC1GZCLkPzRv1H0pz5yyC9QZBZBRfctDYB7EFUzvHSCbSWPDAtwZCFmGmomuQyhi9Ja2Vj3xog6ZCKpH3dmj8Qguv2QsD5esrEbmJz6bWZCWuR02qwIJmgZB9zel5zWzwMmsypc8FBob4hoWGXvOgeSMX7QdrQZDZD"

  after_commit :get_data

  API_URL = "https://login.housing.com//api/v1/profile-details-public"



  def get_data
    response = Rest::Client.get(url)

    self.response = response.body
    self.save
  end



  def url
    "#{API_URL}?profile_uuids=&source=web"
  end

end

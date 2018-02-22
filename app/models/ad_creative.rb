class AdCreative < AdBase
  self.table_name = 'ad_creatives'
  belongs_to :ad_request

  after_create :get_data_from_facebook


  def payload
    {
      "name": "#{ad_request.name} Creative",
      "object_story_spec": {
        "link_data": {
          "image_hash": image_hash,
          "link": "housing.com",
          "message": "lets redirect to housing"
          },
          "page_id": ENV['FACEBOOK_PAGE_ID']
        },
    }
  end


  def action
    "adcreatives"
  end


  def self.create_for_ad_request(ad_request, image_hash)
    ad_creative = new(ad_request_id: ad_request.id)
    ad_creative.image_hash = image_hash
    ad_creative.save!
    ad_creative
  end


  def get_data_from_facebook
    self.facebook_id = post_request['id']
    self.save!
  end


end

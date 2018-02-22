class AdObject < AdBase
  self.table_name = 'ad_objects'

  belongs_to :ad_request
  belongs_to :ad_set
  belongs_to :ad_creative

  after_create :get_data_from_facebook


  def payload
    {
      "name": "#{ad_request.name} Ad",
      "adset_id": ad_set.facebook_id,
      "creative": {"creative_id": ad_creative.facebook_id},
      "status": "ACTIVE"
    }
  end


  def action
    "ads"
  end


  def self.create_for_ad_request(ad_request, ad_set, ad_creative)
    ad_campaign = create!(ad_request_id: ad_request.id, ad_set_id: ad_set.id, ad_creative_id: ad_creative.id)
    ad_campaign
  end


  def get_data_from_facebook
    self.facebook_id = post_request['id']
    self.save!
  end


end

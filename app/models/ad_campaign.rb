class AdCampaign < AdBase
  self.table_name = 'ad_campaigns'
  belongs_to :ad_request

  after_create :get_data_from_facebook


  def payload
    {
      name: name,
      objective: "LINK_CLICKS",
      status: "ACTIVE"
    }
  end


  def action
    "campaigns"
  end


  def self.create_for_ad_request(ad_request)
    ad_campaign = create!(ad_request_id: ad_request.id, name: ad_request.name)
    ad_campaign
  end


  def get_data_from_facebook
    self.facebook_id = post_request['id']
    self.save!
  end


end

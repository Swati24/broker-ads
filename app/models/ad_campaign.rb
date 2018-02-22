class AdCampaign < ActiveRecord::Base

  belongs_to :ad_request

  after_commit :get_data_from_facebook


  def payload
    {
      name: name,
      objective: "LINK_CLICKS",
      status: "ACTIVE"
    }
  end


  def name
    ad_request.name
  end


  def action
    "act_#{account_id}/campaigns"
  end


  def self.create_for_ad_request(ad_request)
    ad_campaign = create(ad_request_id: ad_request.id)
    ad_campaign
  end


  def get_data_from_facebook
    FacebookAds::Base.
  end


end

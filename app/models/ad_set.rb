class AdSet < AdBase
  self.table_name = 'ad_sets'
  belongs_to :ad_request
  belongs_to :ad_campaign

  after_create :get_data_from_facebook


  def payload
    {
      name: "#{ad_request.name} AdSets",
      daily_budget: ad_request.daily_amount,
      optimization_goal: "LINK_CLICKS",
      billing_event: "IMPRESSIONS",
      targeting: { geo_locations:
        localities_array
      },
      campaign_id: ad_campaign.facebook_id,
      status: "ACTIVE",
      bid_amount: "20",
      end_time: Time.current + 2.days,
      promoted_object: {"page_id": ENV['FACEBOOK_PAGE_ID']}
    }
  end

  def localities_array
    # if ad_request.location_details.nil? or ad_request.location_details.empty?
    #   { countries: ['IN'] }
    # else
    #   { custom_locations: ad_request.location_details.map{ |e| { address_string: e, radius: '5', distance_unit: 'kilometer'} }.first}
    # end

    { countries: ['IN'] }
  end


  def action
    "adsets"
  end


  def self.create_for_ad_request(ad_request, ad_campaign)
    ad_set = create!(ad_request_id: ad_request.id, ad_campaign_id: ad_campaign.id)
    ad_set
  end


  def get_data_from_facebook
    self.facebook_id = post_request['id']
    self.save!
  end


end

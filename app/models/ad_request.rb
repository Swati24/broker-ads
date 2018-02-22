class AdRequest < ActiveRecord::Base

  ACCESS_TOKEN = ENV['ACCESS_TOKEN']

  after_commit :get_broker_data, on: :create

  API_URL = "https://login.housing.com/api/v1/profile-details-public"

  serialize :response
  serialize :location_details

  has_many :ad_campaigns
  has_many :ad_creatives
  has_many :ad_images
  has_many :ad_sets

  def get_broker_data
    response = RestClient.get(url)

    if response.code == 200
      self.response = JSON.parse(response.body)['results']
      self.save!
      parse_broker_attributes
    end
  end

  def initiate_ad_workflow
    ad_campaign = AdCampaign.create_for_ad_request(self)
    ad_image = AdImage.create_for_ad_request(self)
    ad_set = AdSet.create_for_ad_request(self, ad_campaign)
    ad_creative = AdCreative.create_for_ad_request(self, ad_image.facebook_hash)
    ad_object = AdObject.create_for_ad_request(self, ad_set, ad_creative)
  end

  def parse_broker_attributes
    self.name = get_broker_name
    self.image_urls = get_broker_image
    self.location_details = get_broker_location_details
    self.save!

    initiate_ad_workflow
  end

  def get_broker_name
    response[broker_uuid]['name']
  end

  def get_broker_image
    url = response[broker_uuid]['firm_logo_url'] || response[broker_uuid]['image_url']
    url.gsub('version', 'medium')
  end

  def get_broker_location_details
    response[broker_uuid]['localities']
  end

  def url
    "#{API_URL}?profile_uuids=#{broker_uuid}&source=web"
  end

end

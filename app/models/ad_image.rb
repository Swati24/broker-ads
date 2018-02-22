class AdImage < AdBase
  self.table_name = 'ad_images'
  mount_uploader :ad_file, AdFileUploader

  belongs_to :ad_request
  after_create :get_data_from_facebook

  def self.create_for_ad_request(ad_request)
    image = new(ad_request_id: ad_request.id)
    image.remote_ad_file_url = ad_request.image_urls
    image.save!

    image
  end


  def payload
    {
      filename: File.open(ad_file.path),
      access_token: ENV['ACCESS_TOKEN'],
      multipart: true
    }
  end


  def action
    "adimages"
  end

  def get_data_from_facebook
    response = JSON.parse post_request
    image_response = response['images'].values[0]
    self.facebook_hash = image_response['hash']
    self.facebook_url = image_response['url']
    self.save!
  end

  def post_request
    response = RestClient.post url, payload
  end






end

class AdBase < ActiveRecord::Base


  def payload
    {}
  end

  def params
    {}
  end

  def action
    ""
  end

  def base_url
    "https://graph.facebook.com/v2.12/act_#{ENV['ACCOUNT_ID']}"
  end

  def url
    "#{base_url}/#{action}"
  end

  def headers
    {"Content-Type" => "application/json"}
  end

  def get_request
    RestClient.get(url, params)
  end


  def post_request
    body = payload.merge({access_token: ENV['ACCESS_TOKEN']})
    response = RestClient::Request.execute(
      method: :post,
      url: url,
      payload: body,
      headers: headers
    )

    if response.code == 200
      JSON.parse response.body
    else
      raise Unauthorized
    end
  end



end

class AddColumnAdRequestIdToAdCampaigns < ActiveRecord::Migration
  def change
    add_column :ad_campaigns, :ad_request_id, :integer
  end
end

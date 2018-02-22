class AddColumnAdRequestIdToAdCreatives < ActiveRecord::Migration
  def change
    add_column :ad_creatives, :ad_request_id, :integer
  end
end

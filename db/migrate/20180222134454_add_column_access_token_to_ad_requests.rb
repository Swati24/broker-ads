class AddColumnAccessTokenToAdRequests < ActiveRecord::Migration
  def change
    add_column :ad_requests, :access_token, :string
  end
end

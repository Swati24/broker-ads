class AddColumnFacebookIdToAdObjects < ActiveRecord::Migration
  def change
    add_column :ad_objects, :facebook_id, :string
  end
end

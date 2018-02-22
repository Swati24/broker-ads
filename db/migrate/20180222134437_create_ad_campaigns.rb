class CreateAdCampaigns < ActiveRecord::Migration
  def change
    create_table :ad_campaigns do |t|
      t.string :name
      t.string :objective
      t.string :status
      t.string :facebook_id

      t.timestamps null: false
    end
  end
end

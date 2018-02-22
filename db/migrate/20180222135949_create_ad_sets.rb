class CreateAdSets < ActiveRecord::Migration
  def change
    create_table :ad_sets do |t|
      t.integer :ad_request_id
      t.string :name
      t.integer :lifetime_budget
      t.string :optimization_goal
      t.string :billing_event
      t.text :targeting
      t.integer :ad_campaign_id
      t.string :status
      t.integer :bid_amount
      t.datetime :end_time
      t.text :promoted_object
      t.string :facebook_id


      t.timestamps null: false
    end
  end
end

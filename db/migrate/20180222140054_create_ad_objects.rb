class CreateAdObjects < ActiveRecord::Migration
  def change
    create_table :ad_objects do |t|
      t.integer :ad_request_id
      t.string :name
      t.string :status
      t.integer :adset_id
      t.integer :ad_creative_id

      t.timestamps null: false
    end
  end
end

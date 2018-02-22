class CreateAdRequests < ActiveRecord::Migration
  def change
    create_table :ad_requests do |t|
      t.string :broker_uuid
      t.text :response
      t.string :name
      t.text :location_details
      t.text :image_urls

      t.timestamps null: false
    end
  end
end

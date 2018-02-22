class CreateAdImages < ActiveRecord::Migration
  def change
    create_table :ad_images do |t|
      t.integer :ad_request_id
      t.string :facebook_hash
      t.string :facebook_url

      t.timestamps null: false
    end
  end
end

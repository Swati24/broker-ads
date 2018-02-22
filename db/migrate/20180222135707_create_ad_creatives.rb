class CreateAdCreatives < ActiveRecord::Migration
  def change
    create_table :ad_creatives do |t|
      t.string :name
      t.string :image_hash
      t.string :link
      t.string :message
      t.string :facebook_id

      t.timestamps null: false
    end
  end
end

class AddAdFileToAdImages < ActiveRecord::Migration
  def change
    add_column :ad_images, :ad_file, :string
  end
end

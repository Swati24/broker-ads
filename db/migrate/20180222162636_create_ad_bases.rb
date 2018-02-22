class CreateAdBases < ActiveRecord::Migration
  def change
    create_table :ad_bases do |t|

      t.timestamps null: false
    end
  end
end

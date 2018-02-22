class RenameColumnInAdObjects < ActiveRecord::Migration
  def change
    rename_column :ad_objects, :adset_id, :ad_set_id
  end
end

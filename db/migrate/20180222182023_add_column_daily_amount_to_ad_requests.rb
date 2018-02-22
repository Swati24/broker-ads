class AddColumnDailyAmountToAdRequests < ActiveRecord::Migration
  def change
    add_column :ad_requests, :daily_amount, :integer, default: 0
  end
end

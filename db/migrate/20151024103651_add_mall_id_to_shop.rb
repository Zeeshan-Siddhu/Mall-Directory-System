class AddMallIdToShop < ActiveRecord::Migration
  def change
    add_column :shops, :mall_id, :integer
  end
end

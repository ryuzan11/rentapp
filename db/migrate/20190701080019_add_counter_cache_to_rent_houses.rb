class AddCounterCacheToRentHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :rent_houses, :impressions_count, :integer, default: 0
  end
end

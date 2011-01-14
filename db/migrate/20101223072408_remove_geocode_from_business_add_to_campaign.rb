class RemoveGeocodeFromBusinessAddToCampaign < ActiveRecord::Migration
  def self.up
    add_column(:campaigns, :lat, :decimal)
    add_column(:campaigns, :lng, :decimal)
  end

  def self.down
  end
end

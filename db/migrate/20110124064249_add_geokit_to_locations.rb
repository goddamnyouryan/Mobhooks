class AddGeokitToLocations < ActiveRecord::Migration
  def self.up
    add_column(:locations, :lat, :decimal)
    add_column(:locations, :lng, :decimal)
  end

  def self.down
  end
end

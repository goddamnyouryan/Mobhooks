class ChangeRedeemedFromStringToIntegerOnHeroku < ActiveRecord::Migration
  def self.up
    change_column(:users, :redeemed, :integer, {:default => 1, :null => false})
  end

  def self.down
  end
end

class AddRedeemedToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :redeemed, :integer, :default => 0
  end

  def self.down
    remove_column :users, :redeemed
  end
end

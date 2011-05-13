class RemoveRedeemed < ActiveRecord::Migration
  def self.up
    remove_column :users, :redeemed
  end

  def self.down
  end
end

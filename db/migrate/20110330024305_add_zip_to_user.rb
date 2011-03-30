class AddZipToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :zip, :string
  end

  def self.down
  end
end

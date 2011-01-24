class AddKindToBusinesses < ActiveRecord::Migration
  def self.up
    add_column :businesses, :kind, :string
    add_column :businesses, :url, :string
  end

  def self.down
  end
end

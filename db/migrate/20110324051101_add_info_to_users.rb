class AddInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :birthday, :datetime
    add_column :users, :sex, :string
    add_column :users, :phonenumber, :string
  end

  def self.down
  end
end

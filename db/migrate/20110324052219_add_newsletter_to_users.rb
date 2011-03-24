class AddNewsletterToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :newsletter, :boolean, :default => true
  end

  def self.down
  end
end

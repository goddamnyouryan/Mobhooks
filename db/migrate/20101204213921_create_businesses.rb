class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end

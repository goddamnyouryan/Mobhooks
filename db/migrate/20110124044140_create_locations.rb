class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :business_id
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end

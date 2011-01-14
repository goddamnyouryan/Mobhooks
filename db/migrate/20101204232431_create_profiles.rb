class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.integer :zip
      t.string :sex
      t.datetime :birthday
      t.string :website
      t.string :quote
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end

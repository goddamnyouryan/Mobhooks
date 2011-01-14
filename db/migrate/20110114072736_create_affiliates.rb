class CreateAffiliates < ActiveRecord::Migration
  def self.up
    create_table :affiliates do |t|
      t.integer :user_id
      t.string :name
      t.string :business_name
      t.string :address
      t.string :phone_number
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :affiliates
  end
end

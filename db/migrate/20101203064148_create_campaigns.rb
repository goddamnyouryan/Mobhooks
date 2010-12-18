class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.integer :user_id
      t.integer :business_id
      t.string :offer
      t.integer :shortcode
      t.string :keyword
      t.datetime :start_date
      t.datetime :end_date
      t.string :type
      t.text :details
      t.timestamps
    end
  end

  def self.down
    drop_table :campaigns
  end
end

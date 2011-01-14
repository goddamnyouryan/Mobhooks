class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :campaign_id
      t.integer :reviewer_id
      t.text :message
      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end

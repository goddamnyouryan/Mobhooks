class CreateSuggestions < ActiveRecord::Migration
  def self.up
    create_table :suggestions do |t|
      t.integer :user_id
      t.text :message
      t.timestamps
    end
  end

  def self.down
    drop_table :suggestions
  end
end

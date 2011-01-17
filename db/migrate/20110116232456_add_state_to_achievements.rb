class AddStateToAchievements < ActiveRecord::Migration
  def self.up
    add_column :achievements, :state, :string, :default => "unread"
  end

  def self.down
  end
end

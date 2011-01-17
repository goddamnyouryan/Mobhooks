class ChangeAchievementTypeName < ActiveRecord::Migration
  def self.up
    rename_column(:achievements, :type, :kind)
  end

  def self.down
  end
end

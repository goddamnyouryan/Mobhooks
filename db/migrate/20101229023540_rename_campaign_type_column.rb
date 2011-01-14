class RenameCampaignTypeColumn < ActiveRecord::Migration
  def self.up
    rename_column :campaigns, :type, :kind
  end

  def self.down
  end
end

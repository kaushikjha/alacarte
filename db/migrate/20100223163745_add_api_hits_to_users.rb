class AddApiHitsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :hits, :integer, :default => 0
    add_column :users, :rate_limit, :integer, :default => 200
  end

  def self.down
    remove_column :users, :rate_limit
    remove_column :users, :hits
  end
end

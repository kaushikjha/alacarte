class AddRestaurantNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :restaurant_name, :string
  end

  def self.down
    remove_column :users, :restaurant_name
  end
end

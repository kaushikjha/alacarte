class AddPositionToMenus < ActiveRecord::Migration
  def self.up
    add_column :menus, :position, :integer
    
    users = User.find(:all)
    Menu.reset_column_information
    users.each do |u|
      u.menus.each_with_index do |m, i|
        m.position = i + 1
        m.save!
      end
    end
  end

  def self.down
    remove_column :menus, :position
  end
end

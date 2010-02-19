class AddPositionToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :position, :integer
    
    users = User.find(:all)
    Item.reset_column_information
    users.each do |u|
      u.menus.each do |m|
        m.categories.each do |c|
          c.items.each_with_index do |i, n|
            i.position = n + 1
            i.save!
          end
        end
      end
    end
  end

  def self.down
    remove_column :items, :position
  end
end

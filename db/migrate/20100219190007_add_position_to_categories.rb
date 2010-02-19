class AddPositionToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :position, :integer
    
    users = User.find(:all)
    Category.reset_column_information
    users.each do |u|
      u.menus.each do |m|
        m.categories.each_with_index do |c, i|
          c.position = i + 1
          c.save!
        end
      end
    end
  end

  def self.down
    remove_column :categories, :position
  end
end

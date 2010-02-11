class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.integer :user_id
      t.integer :item_id
      t.text :description
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end

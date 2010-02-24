class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedback do |t|
      t.integer :user_id
      t.datetime :time
      t.string :subject
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :feedback
  end
end

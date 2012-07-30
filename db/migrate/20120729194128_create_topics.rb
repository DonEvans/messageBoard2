class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
		add_index :topics, [:user_id, :created_at]
  end

  def self.down
    drop_table :topics
  end
end

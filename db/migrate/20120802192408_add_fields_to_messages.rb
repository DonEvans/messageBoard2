class AddFieldsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :topic_id, :integer

  end
end

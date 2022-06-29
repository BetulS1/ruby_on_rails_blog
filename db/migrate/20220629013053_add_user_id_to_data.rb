class AddUserIdToData < ActiveRecord::Migration[7.0]
  def change
    add_column :data, :user_id, :integer
    add_index :data, :user_id
  end
end

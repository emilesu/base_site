class AddIndexTooPost < ActiveRecord::Migration[5.1]
  def change
    add_index :posts, :user_id
    add_index :posts, :project_id
  end
end

class AddIndexUserWorkspace < ActiveRecord::Migration[7.0]
  def change
    add_index :members, [:user_id, :workspace_id], unique: true
  end
end

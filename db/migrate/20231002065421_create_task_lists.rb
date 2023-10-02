class CreateTaskLists < ActiveRecord::Migration[7.0]
  def change
    create_table :task_lists do |t|
      t.string :title, null: false
      t.string :description
      t.references :workspace, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

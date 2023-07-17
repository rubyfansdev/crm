class CreateThreads < ActiveRecord::Migration[7.0]
  def change
    create_table :threads do |t|
      t.string :title, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.datetime :due_by
      t.boolean :complete

      t.timestamps
    end
  end
end

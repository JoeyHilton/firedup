class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true
      t.string :title
      t.date :due_date
      t.time :due_time
      t.string :category
      t.boolean :private
      t.text :notes

      t.timestamps null: false
    end
    add_foreign_key :tasks, :users
  end
end

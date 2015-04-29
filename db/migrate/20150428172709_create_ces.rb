class CreateCes < ActiveRecord::Migration
  def change
    create_table :ces do |t|
      t.string :topic
      t.date :date
      t.integer :hours
      t.string :classtype
      t.text :notes
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :ces, :users
  end
end

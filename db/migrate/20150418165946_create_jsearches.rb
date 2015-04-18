class CreateJsearches < ActiveRecord::Migration
  def change
    create_table :jsearches do |t|
      t.string :keywords
      t.string :category
      t.string :state
      t.string :city
      t.string :agency

      t.timestamps null: false
    end
  end
end

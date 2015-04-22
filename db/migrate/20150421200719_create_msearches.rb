class CreateMsearches < ActiveRecord::Migration
  def change
    create_table :msearches do |t|
      t.string :fname
      t.string :lname
      t.string :city
      t.string :state
      t.string :agency

      t.timestamps null: false
    end
  end
end

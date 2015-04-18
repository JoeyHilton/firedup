class CreateJboards < ActiveRecord::Migration
  def change
    create_table :jboards do |t|
      t.string :title
      t.string :position
      t.string :identifier
      t.text :description
      t.text :requirements
      t.text :how_to_apply
      t.string :salary
      t.date :open_date
      t.date :close_date
      t.string :agency
      t.string :city
      t.string :state
      t.string :zip
      t.string :website
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :job_link
      t.string :poster

      t.timestamps null: false
    end
  end
end

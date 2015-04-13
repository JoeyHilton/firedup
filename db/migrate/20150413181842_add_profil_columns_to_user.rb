class AddProfilColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :twitter, :string
    add_column :users, :birthdate, :date
    add_column :users, :phone, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :gender, :string
    add_column :users, :secondary_email, :string
    add_column :users, :bio, :text
  end
end

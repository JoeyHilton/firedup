class AddRefToCerts < ActiveRecord::Migration
  def change
    add_reference :certs, :user, index: true
    add_foreign_key :certs, :users
  end
end

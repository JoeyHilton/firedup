class AddRefToCerts < ActiveRecord::Migration
  def change
    add_reference :certs, :profile, index: true
    add_foreign_key :certs, :profiles
  end
end

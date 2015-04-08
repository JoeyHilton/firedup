class CreateCerts < ActiveRecord::Migration
  def change
    create_table :certs do |t|
      t.string :cert_title
      t.date :cert_startdate
      t.date :cert_expiredate
      t.text :cert_description

      t.timestamps null: false
    end
  end
end

class FixCertsColumnNames < ActiveRecord::Migration
  def change
    change_table :certs do |t|
      t.rename :cert_title, :title
      t.rename :cert_startdate, :start_date
      t.rename :cert_expiredate, :expire_date
      t.rename :cert_description, :description
    end
  end
end

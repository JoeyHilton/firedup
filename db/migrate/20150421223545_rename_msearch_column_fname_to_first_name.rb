class RenameMsearchColumnFnameToFirstName < ActiveRecord::Migration
  def change
    rename_column :msearches, :fname, :first_name
    rename_column :msearches, :lname, :last_name
  end
end

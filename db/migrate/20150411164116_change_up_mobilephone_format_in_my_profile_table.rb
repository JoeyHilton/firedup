class ChangeUpMobilephoneFormatInMyProfileTable < ActiveRecord::Migration
  def change
    change_column(:profiles, :up_mobilephone, :string)
  end
end

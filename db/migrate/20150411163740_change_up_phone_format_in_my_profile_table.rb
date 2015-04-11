class ChangeUpPhoneFormatInMyProfileTable < ActiveRecord::Migration
  def change
    change_column(:profiles, :up_phone, :string)
  end
end

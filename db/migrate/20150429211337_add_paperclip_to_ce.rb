class AddPaperclipToCe < ActiveRecord::Migration
  def change
    add_attachment :ces, :file
  end
end

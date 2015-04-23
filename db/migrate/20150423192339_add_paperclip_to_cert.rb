class AddPaperclipToCert < ActiveRecord::Migration
  def change
    add_attachment :certs, :attachment
  end
end

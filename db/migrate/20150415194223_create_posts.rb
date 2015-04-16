class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.text :content
      t.string :share_with

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
  end
end

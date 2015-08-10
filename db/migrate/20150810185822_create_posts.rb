class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :city
      t.string :author
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end

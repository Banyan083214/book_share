class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :synopsis
      t.integer :genre_id, null: false
      t.string :author, null: false
      t.date :publication_date
      t.text :text, null: false
      t.references :user, null: false, foreign_key: true

      
      t.timestamps
    end
  end
end

class CreateBookGenreRelations < ActiveRecord::Migration
  def change
    create_table :book_genre_relations do |t|
      t.integer :book_id,  null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end


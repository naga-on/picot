class AddColumnBookIdToVolume < ActiveRecord::Migration
  def change
    add_column :volumes, :book_id, :integer, null: false
  end
end

class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :title,     null: false
      t.string  :author,    null: false, default: ""
      t.integer :page,      null: false, default: 0
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end


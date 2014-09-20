class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.string  :title,     null: false
      t.string  :pdf_file,  null: false, default: ""
      t.string  :img_dir,   null: false, default: ""
      t.integer :page,      null: false, default: 0
      t.integer :cover,     null: false, default: 1
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end


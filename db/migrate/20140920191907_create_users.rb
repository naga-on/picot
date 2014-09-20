class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name,            null: false
      t.string  :password_digest, null: false
      t.boolean :is_admin,        null: false, default: false
      t.boolean :is_active,       null: false, default: true

      t.timestamps
    end
  end
end


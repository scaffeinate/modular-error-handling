class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :email, null: false

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end

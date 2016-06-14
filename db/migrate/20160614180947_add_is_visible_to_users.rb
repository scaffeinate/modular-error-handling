class AddIsVisibleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_visible, :boolean, default: false
  end
end

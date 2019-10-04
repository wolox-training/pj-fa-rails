class RemoveColumnToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :name
    remove_column :users, :nickname
    remove_column :users, :image
  end
end

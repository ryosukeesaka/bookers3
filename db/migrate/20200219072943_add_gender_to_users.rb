class AddGenderToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :price, :integer
    add_column :users, :gender, :integer, default: 0, null: false, limit: 1
  end
end

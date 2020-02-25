class AddAgeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer, default: 0, null: false, limit: 1
   
  end
end

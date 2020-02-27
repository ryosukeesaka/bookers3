class AddSexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sex, :string, default: 0, null: false, limit: 1
  end
end

class AddLogPassToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :login, :string
    add_column :users, :password, :string
  end
end

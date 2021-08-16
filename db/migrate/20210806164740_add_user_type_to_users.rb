class AddUserTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_type, :integer
    add_column :users, :name,  :text
    add_column :users, :rut, :string
    add_column :users, :address, :text
    add_column :users, :phone, :string
    add_column :users, :photo, :string
  end
end

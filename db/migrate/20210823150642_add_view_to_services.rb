class AddViewToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :view, :integer
  end
end

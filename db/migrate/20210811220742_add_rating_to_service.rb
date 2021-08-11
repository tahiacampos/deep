class AddRatingToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :rating, :integer
  end
end

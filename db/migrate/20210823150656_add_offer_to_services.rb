class AddOfferToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :offer, :integer
  end
end

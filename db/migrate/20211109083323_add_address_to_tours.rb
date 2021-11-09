class AddAddressToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :address, :string
  end
end

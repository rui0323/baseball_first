class AddAddressToShoppingAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_addresses, :address, :string
  end
end

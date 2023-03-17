class AddNameToShoppingAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_addresses, :name, :string
  end
end

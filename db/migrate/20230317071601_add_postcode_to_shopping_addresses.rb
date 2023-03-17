class AddPostcodeToShoppingAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_addresses, :postcode, :string
  end
end

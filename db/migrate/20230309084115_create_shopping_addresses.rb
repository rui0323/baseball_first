class CreateShoppingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_addresses do |t|

      t.timestamps
    end
  end
end

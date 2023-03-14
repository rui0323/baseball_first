class AddPostcodeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :postcode, :string
  end
end

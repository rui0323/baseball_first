class AddShippingFeeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :shipping_fee, :integer
  end
end

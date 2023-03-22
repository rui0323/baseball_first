class AddTotalPriceToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :total_price, :integer
  end
end

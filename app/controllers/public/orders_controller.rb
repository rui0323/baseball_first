class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
  　@order = current_customer.orders.new(order_params)
    if @order.save
       cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.total_price = cart.item.price
        order_detail.save
        end
      cart_items.destroy_all
      redirect_to orders_complete_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end


  def confirm
    @order = Order.new(order_params)
     @sub_total = 0
     @cart_item_total_price = 0
    @order.shipping_fee = 800

    if params[:order][:address_number] == "1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      #@order.name = current_customer.name
    elsif params[:order][:address_number] == "2"
       @shopping_address = ShoppingAddress.find(params[:order][:registered])
       @order.postcode = @shopping_address.postcode
       @order.address = @shopping_address.address
       @order.name = @shopping_address.name
    end
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :total_price, :postcode, :address, :name)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end

end

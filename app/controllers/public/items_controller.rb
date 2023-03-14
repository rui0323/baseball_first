class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @items = Item.all
  end

  def show
    @item =  Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private
 def item_params
  params.require(:items).permit(:genre_id,:name,:description,:price)
 end
  
  
end

class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]

  def index
    @items = Item.page(params[:page]).per(10)
    @genres = Genre.all
    #@genre = Genre.find(params[:id])
    if params[:genre_id]
    @items = @items.where(genre_id: params[:genre_id])
    @title = Genre.find(params[:genre_id]).name
    else
    @items = @items.all
    @title = "商品"
    end
  end

  def show
    @item =  Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  private
 def item_params
  params.require(:items).permit(:genre_id,:name,:description,:price)
 end


end

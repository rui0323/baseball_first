class  Public::LikesController < ApplicationController
   before_action :authenticate_customer!
  def create
    @like = current_customer.likes.build(like_params)
    @item = @like.item
    if @like.valid?
      @like.save
      redirect_to item_path(@item)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @item = @like.item
    if @like.destroy
      redirect_to item_path(@item)
    end
  end

  private
  def like_params
    params.permit(:item_id)
  end
end

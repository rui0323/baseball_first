class Admin::ItemsController < ApplicationController

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @item.save

    redirect_to admin_items_path(@item.id)
  end

  def index
     @items = Item.all
    
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end


  def destroy
    item = Item.find(params[:id])  # データ（レコード）を1件取得
    item.destroy  # データ（レコード）を削除
    redirect_to  admin_items_path  # 投稿一覧画面へリダイレクト
  end


  private

  def item_params
    params.require(:item).permit(:name,:description, :image, :price, :genre_id)
  end

end

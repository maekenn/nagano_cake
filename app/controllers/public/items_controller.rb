class Public::ItemsController < ApplicationController

  def top
    @items = Item.all.page(params[:page]).per(4)
  end
  def index
    @total_items = Item.all
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def items_params
    parmas.require(:item).permit(:genle_id, :name, :introduction, :price, :is_active, :image)
  end
end

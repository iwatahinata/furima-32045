class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title, :image, :explain, :category_id, :status_id, :derivery_fee_id, :derivery_area_id, :derivery_days_id, :price)
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  
  def index
    @items = Item.all.order("id DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end 


  private
  def item_params
    params.require(:item).permit(:title, :image, :explain, :category_id, :status_id, :fee_id, :days_id, :price, :prefecture_id).merge(user_id: current_user.id)
  end

end

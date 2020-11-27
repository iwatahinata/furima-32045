class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: :edit
  
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

  def edit
  end 

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id = @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end


  private
  def item_params
    params.require(:item).permit(:title, :image, :explain, :category_id, :status_id, :fee_id, :days_id, :price, :prefecture_id).merge(user_id: current_user.id)
  end
  

  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

end

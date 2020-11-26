class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @buy_house = BuyHouse.new
    @item = Item.find(params[:item_id])
    # 商品のidをparamsから取得したい
  end
  def create
    @item = Item.find(params[:item_id])
    @buy_house = BuyHouse.new(buy_params)
    if @buy_house.valid?
      @buy_house.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private
      # 全てのストロングパラメーターを1つに統合
  def buy_params
      params.require(:buy_house).permit(:postal_code, :prefecture_id, :city, :address, :house_name, :phone_number, :buy).merge(user_id: current_user.id,item_id: params[:item_id])
  end

 end
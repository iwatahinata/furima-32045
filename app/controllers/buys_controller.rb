class BuysController < ApplicationController
  def index
    @buy_house = BuyHouse.new
    @item = Item.find(params[:item_id])
    # 商品のidをparamsから取得したい
  end
  def create
    @buy_house = BuyHouse.new(buy_params)
    if @buy_house.valid?
      @buy_house.save
      redirect_to action: :index
    end
  end


  private
      # 全てのストロングパラメーターを1つに統合
  def buy_params
      params.require(:buy_house).permit(:postal_code, :prefecture_id, :city, :address, :house_name, :phone_number, :user, :item, :buy)
  end

 end
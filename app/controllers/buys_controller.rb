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
      pay_item
      @buy_house.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private
      # 全てのストロングパラメーターを1つに統合
  def buy_params
      params.require(:buy_house).permit(:postal_code, :prefecture_id, :city, :address, :house_name, :phone_number, :buy).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buy_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

 end
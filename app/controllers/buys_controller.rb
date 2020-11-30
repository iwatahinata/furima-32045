class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index
  def index
    @buy_house = BuyHouse.new
    # 商品のidをparamsから取得したい
  end
  def create
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
      params.require(:buy_house).permit(:postal_code, :prefecture_id, :city, :address, :house_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buy_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def move_to_index
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

 end
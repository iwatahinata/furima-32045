require 'rails_helper'

RSpec.describe BuyHouse, type: :model do
  describe '購入情報の保存' do
    before do
      @buy_house = FactoryBot.build(:buy_house)
    end

  context '購入情報の保存がうまくいくとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buy_house).to be_valid
    end
  end

  context "購入情報の保存ができない場合" do
    it 'postal_codeが空だと保存できないこと' do
      @buy_house.postal_code = nil
        @buy_house.valid?
        expect(@buy_house.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buy_house.postal_code = '1234567'
        @buy_house.valid?
        expect(@buy_house.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @buy_house.prefecture_id = 0
        @buy_house.valid?
        expect(@buy_house.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @buy_house.city = nil
        @buy_house.valid?
        expect(@buy_house.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @buy_house.address = nil
        @buy_house.valid?
        expect(@buy_house.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone＿numberが空だと保存できないこと' do
      @buy_house.phone_number = nil
        @buy_house.valid?
        expect(@buy_house.errors.full_messages).to include("Phone number 11桁以内で入力してください")
    end
    it 'phone＿number11桁以上だと保存できないこと' do
      @buy_house.phone_number = '090123456789'
        @buy_house.valid?
        expect(@buy_house.errors.full_messages).to include("Phone number 11桁以内で入力してください")
    end
    it 'phone＿numberが数字のみでないと保存できないこと' do
      @buy_house.phone_number = '090aaaa1234'
        @buy_house.valid?
        expect(@buy_house.errors.full_messages).to include("Phone number 11桁以内で入力してください")
    end
    it 'tokenが空だと保存できないこと' do
      @buy_house.token = nil
      @buy_house.valid?
      expect(@buy_house.errors.full_messages).to include("Token can't be blank")
    end
  end
 end
end

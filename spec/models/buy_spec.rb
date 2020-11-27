require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @buy = FactoryBot.build(:buy)
  end

  it "priceとtokenがあれば保存ができること" do
    
  end

  it "priceが空では登録できないこと" do
   
  end

  it "tokenが空では登録できないこと" do

  end
end

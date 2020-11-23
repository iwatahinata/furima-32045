require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/aiueo.png')
  end

  describe '商品情報の保存' do
    context '商品の保存がうまくいくとき' do
      it "全ての項目が存在すれば保存できる" do
        expect(@item).to be_valid
      end
    end

    context "商品の保存ができない場合" do
      it "タイトルがないと商品は保存できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end     
      it "説明文がないと商品は保存できない" do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it "画像がないと商品は保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "カテゴリー情報がないと商品は保存できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品状態の情報がないと商品は保存できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の情報がないと商品は保存できない" do
        @item.deriveryFee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deriveryfee can't be blank")
      end
      it "発送元の地域情報がないと商品は保存できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数情報がないと商品は保存できない" do
        @item.deriveryDays_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deriverydays can't be blank")
      end
      it "価格についての情報がないと商品は保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が300以上でないと商品は保存できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が9999999以下でないと商品は保存できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "価格が半角数字でないと商品は保存できない" do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "ユーザーが紐付いていないと商品は保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

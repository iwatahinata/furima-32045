class BuyHouse
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :house_name, :phone_number, :user, :item, :buy

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, presence: true
    validates :address, presence: true
    validates :phone_number, presence: true

    def save
      # 購入情報を保存し、「buy」という変数に入れている
      buy = Buy.create(item: item, user: user)
      # 住所の情報を保存
      House.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, house_name: house_name, phone_number: phone_number, user_id: user.id) 
    end
end
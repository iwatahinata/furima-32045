class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_one :buy
end

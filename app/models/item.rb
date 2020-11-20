class Item < ApplicationRecord
  validates :image,            presence: true
  validates :title,            presence: true
  validates :explain,          presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1 }
  validates :status_id,        presence: true, numericality: { other_than: 1 }
  validates :deriveryFee_id,  presence: true,  numericality: { other_than: 1 }
  validates :prefecture_id,    presence: true, numericality: { other_than: 1 }
  validates :deriveryDays_id, presence: true,  numericality: { other_than: 1 }
  validates :price,            presence: true
 
 
 
  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :deriveryDays
  belongs_to :deriveryFee
  belongs_to :category
  belongs_to :status
end

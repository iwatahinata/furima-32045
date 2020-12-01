class Item < ApplicationRecord
  validates :image,            presence: true
  validates :title,            presence: true
  validates :explain,          presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1 }
  validates :status_id,        presence: true, numericality: { other_than: 1 }
  validates :fee_id,           presence: true,  numericality: { other_than: 1 }
  validates :prefecture_id,    presence: true, numericality: { other_than: 1 }
  validates :days_id,          presence: true,  numericality: { other_than: 1 }
  validates :price, presence: true
  validates :price,presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

 
  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :days
  belongs_to :fee
  belongs_to :category
  belongs_to :status

  def self.search(search)
    if search != ""
      Item.where('title LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :burden_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, numericality: { only_integer: true }, inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
end

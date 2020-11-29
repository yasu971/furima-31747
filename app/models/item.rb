class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee_burden
  belongs_to :prefecture
  belongs_to :delivery_period
  validates :name, :description ,:image, presence: true
  validates :category_id, :item_condition_id, :delivery_fee_burden_id, :prefecture_id, :delivery_period_id, numericality: { other_than: 1 } 
  
  validates :price, presence: true,  numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'Price is out of range' }
end
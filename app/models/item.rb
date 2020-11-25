class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture, :category, :delivery_fee_burden, :delivery_period, :item_condition
  validates :name, :description ,:image, presence: true
  validates :category_id, :item_condition_id, :delivery_fee_burden_id, :delivery_fee_burden_id, :delivery_period_id, numericality: { other_than: 1 } 
  
  validates :price, presence: true,  numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'Price is out of range' }
end
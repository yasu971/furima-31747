class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :choice, :prefecture, :category, :delivery_fee_burden, :delivery_period, :item_condition
  validates :name, :description, :category_id, :item_condition_id, :delivery_fee_burden_id, :delivery_fee_burden_id, :delivery_period_id, :price, :image, presence: true
  
end

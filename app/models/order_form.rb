class OrderForm
  include ActiveModel::Model
  attr_accessor :order, :user, :item, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :telephone_number

  validates :order, presence: true
  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :house_number, presence: true
  validates :telephone_number, presence: true
  
  def save
    Order.create(order: order)
    Address.create(address: address)
  end
end
class OrderForm
  include ActiveModel::Model
  attr_accessor :order_id, :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :telephone_number, :token

  validates :user_id, presence: true
  validates :item_id, presence: true

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :municipality, presence: true
  validates :house_number, presence: true
  validates :telephone_number, presence: true
  validates :token, presence: true
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, telephone_number: telephone_number)
  end
end


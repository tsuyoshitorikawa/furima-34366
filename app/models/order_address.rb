class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :from_city, :from_address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id,      numericality: {other_than: 1, message: "can't be blank"}
    validates :from_city
    validates :from_address
    validates :user_id
    validates :item_id
    validates :token
    validates :phone_number,  numericality: {only_integer: true, length: {maximum: 11}, message: "is invalid"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, area_id: area_id, from_city: from_city, from_address: from_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
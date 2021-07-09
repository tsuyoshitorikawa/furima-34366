class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :delivery_state
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image 
    validates :product_name
    validates :description_name
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is invalid"}
  end

  with_options numericality: {other_than: 1, message: "can't be blank"} do
    validates :delivery_state_id
    validates :burden_id
    validates :area_id
    validates :day_to_ship_id
    validates :category_id
  end

end

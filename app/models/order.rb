class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end
  
def save
  purchase = Purchase.create(item_id: item_id, user_id: user_id)
  Address.create(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number, building: building)
end
end


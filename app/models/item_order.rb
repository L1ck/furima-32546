class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :zipcode, :area_id, :city, :district, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token, :city, :district
    validates :user_id
    validates :item_id
    validates :zipcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 , message: "Select"}
    validates :phone_number, numericality: { other_than: 0 , message: "can't be blank" }
    validates :phone_number, format: {with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: "is half-width numerical value"}
    validates :phone_number, format: {with: /(0{1}\d{10})/, message: "at least 11 digit"}
  end

  def save
    order = Order.create!(user_id: @user_id,item_id: item_id)
    Address.create(zipcode: zipcode, area_id: area_id, city: city, district: district, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end

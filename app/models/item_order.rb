class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :zipcode, :area_id, :city, :district, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token, :city, :district
    validates :area_id, numericality: { other_than: 1 }
    # validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{11}\z/ }

    with_options format: { with: /\A\d{3}-\d{4}\z/ } do
      validates :zipcode, length: { is: 8 }
    end
  end

  def save
    Address.create(zipcode: zipcode, area_id: area_id, city: city, district: district, building: building,
                   phone_number: phone_number)
    Order.create(user_id: user_id, item_id: item_id)
  end
end

class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :zip_code, :area_id, :city, :district, :building, :phone_number

  with_options presense: true do
    validates :token, :area_id, :city, :district
    validates :zip_code, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }, length: { is: 8 }
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: { is: 11 }
  end
# itemモデルのvalidation
    # with_options presence: true do
    #   validates :name, :description, :image

    #   with_options numericality: { other_than: 1 } do
    #     validates :category_id, :state_id, :shipping_fee_id, :area_id, :delivery_day_id
    #   end

    #   with_options format: { with: /\A[0-9]+\z/ } do
    #     validates :price, numericality: { greater_than: 300, less_than: 9999999 } 
    #   end
    # end

    def save
      # item = Item.create(name: name, price: price, image: image)
      Address.create(zip_code: zip_code, area_id: area_id, city: city, district: district, building: building, phone_number: phone_number)
      Order.create(user_id: user.id, item_id: item.id)
    end
end
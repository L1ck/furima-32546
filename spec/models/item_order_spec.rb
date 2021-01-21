require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入者情報の保存' do
    before do
      buyer = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @item_order = FactoryBot.build(:item_order, user_id: buyer.id, item_id: item.id)
    end

    it '全ての項目が入力されていれば購入ができる' do
      expect(@item_order).to be_valid
    end
    it 'buildingがなくても登録できる' do
      @item_order.building = nil
      expect(@item_order).to be_valid
    end
    it 'user_idが無いと保存ができないこと' do
      @item_order.user_id = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが無いと保存ができないこと' do
      @item_order.item_id = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Item can't be blank")
    end
    it 'token(クレジットカード情報)が空だと購入ができない' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと購入ができない' do
      @item_order.zipcode = ''
      @item_order.valid?
      expect(@item_order.errors.messages).to include({ zipcode: ["can't be blank", "is invalid. Include hyphen(-)"] })
    end
    it '郵便番号にハイフンがないと登録できない' do
      @item_order.zipcode = '1234567'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Zipcode is invalid. Include hyphen(-)")
    end
    it '郵便番号が8桁出ないと購入できない' do
      @item_order.zipcode = '123-45678'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Zipcode is invalid. Include hyphen(-)")
    end
    it 'areaを選択していないと購入できない' do
      @item_order.area_id = 0
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include()
    end
    it 'cityが空だと購入できない' do
      @item_order.city = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end
    it 'districtが空だと購入できない' do
      @item_order.district = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("District can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @item_order.phone_number = ''
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが12桁以上では登録できない' do
      @item_order.phone_number = '123456789012'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number at least 11 digit")
    end
  end
end
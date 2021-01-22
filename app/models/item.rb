class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :area_id
      validates :delivery_day_id
    end
  end
end

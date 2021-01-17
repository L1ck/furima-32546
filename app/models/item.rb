class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :price, format: { with: /\A[0-9]+\z/ }

  validates :price, :numericality => { :greater_than => 299, :less_than => 9999999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_day

  validates :name, :discription, :price, :category_id, :state_id, :delivery_fee_id, :area_id, :delivery_day_id, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }
end

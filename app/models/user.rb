class User < ApplicationRecord
  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :name_second
      validates :name_first
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :kana_second
      validates :kana_first
    end

    validates :birth
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :buyers
end

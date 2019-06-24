class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :gender
  # accepts_nested_attributes_for :
  has_many :rent_houses
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_rentHouses, through: :likes, source: :rent_house
end

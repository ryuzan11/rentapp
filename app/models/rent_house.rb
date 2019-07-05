class RentHouse < ApplicationRecord
  is_impressionable counter_cache: true

  belongs_to :user
  belongs_to :prefecture
  belongs_to :city
  has_many :comments
  # belongs_to :construction, optional: true
  # belongs_to :walkTime, optional: true
  # belongs_to :layout, optional: true
  # belongs_to :buildingType, optional: true
  # belongs_to :old, optional: true
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  def fav(user)
    likes.create!(user_id: user.id)
  end

  def unfav(user)
    likes.find_by(user_id: user.id).destroy
  end

  def fav?(user)
    # like_users.where(user_id: user.id).exists?
    like_users.include?(user)
  end

end

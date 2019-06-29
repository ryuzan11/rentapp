class Like < ApplicationRecord
  belongs_to :user
  belongs_to :rent_house, optional: true
  counter_culture :rent_house
  validates :user_id, presence: true
  validates :rent_house_id, presence: true
end

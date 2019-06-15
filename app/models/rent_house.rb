class RentHouse < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  belongs_to :city
  has_many :comments
  # belongs_to :construction, optional: true
  # belongs_to :walkTime, optional: true
  # belongs_to :layout, optional: true
  # belongs_to :buildingType, optional: true
  # belongs_to :old, optional: true
end

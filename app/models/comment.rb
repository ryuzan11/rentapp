class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :rent_house, optional: true
end

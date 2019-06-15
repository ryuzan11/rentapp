class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :rentHouse, optional: true
end

class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :product, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
  validates :description, presence: true
end

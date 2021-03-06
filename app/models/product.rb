class Product < ActiveRecord::Base



  has_many :reviews, dependent: :destroy

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def avg_rating
    avg = reviews.average(:rating)
  end

end

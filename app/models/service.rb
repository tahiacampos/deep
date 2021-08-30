class Service < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  has_one_attached :photo
  # CATEGORIES = Category.all
  validates :title, :description, presence: :true
  # validates :category, inclusion: { in: CATEGORIES }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address? 
end

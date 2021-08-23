class Service < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  has_one_attached :photo
  # CATEGORIES = Category.all
  validates :title, :description, presence: :true
  # validates :category, inclusion: { in: CATEGORIES }
 
end

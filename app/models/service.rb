class Service < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  # CATEGORIES = Category.all
  validates :title, :description, presence: :true
  # validates :category, inclusion: { in: CATEGORIES }
 
end

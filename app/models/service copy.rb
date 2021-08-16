class Service < ApplicationRecord
  belongs_to :category
  belongs_to :user
  CATEGORIES = Category.all
  validates :title, :descripcion, presence: :true
  validates :category, inclusion: { in: CATEGORIES }
  
end

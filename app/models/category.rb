class Category < ApplicationRecord
  has_many :services, depend:destroy
end

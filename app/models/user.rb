class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :services
  has_many :bookings
  # enum user_type: [:customer, :supplier]
 
  # validates :name, presence: true
  # validates :address, presence: true
  # validates :phone, presence: true, format: { with: /^(\+?56)?(\s?)(0?9)(\s?)[9876543]\d{7}$/, multiline: true}
end
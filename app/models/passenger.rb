class Passenger < ApplicationRecord
  validates :name, :email, presence: true
  
  belongs_to :booking
  
  has_many :flights, through: :bookings
end

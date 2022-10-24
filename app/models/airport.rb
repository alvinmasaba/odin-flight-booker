class Airport < ApplicationRecord
  validates :code, presence: true

  has_many :departing_flights, foreign_key: :departure_airport_id, class_name: "Flight"
  has_many :arriving_flights, foreign_key: :arrival_airport_id, class_name: "Flight"

  def self.display_airport_code(airport_id)
    airport = self.find_by(id: airport_id)

    airport ? airport.code : ""
  end
end

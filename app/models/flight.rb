class Flight < ApplicationRecord
  validates :date, :duration, presence: true

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def flight_date
    self.date.strftime("%B %-d, %Y")
  end
end

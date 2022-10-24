class Flight < ApplicationRecord
  validates :date, :duration, presence: true

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.search(search)
    if search
      flight = Flight.find_by("departure_airport_id = ? AND arrival_airport_id = ? AND date = ?", search[:departure_airport_id], search[:arrival_airport_id], search[:date].to_datetime)
        if flight
          [flight]
        else
          Flight.all
        end
    else
      Flight.all
    end
  end

  def flight_date
    self.date.strftime("%B %-d, %Y") # Verbose 'Month, Day'
  end
end

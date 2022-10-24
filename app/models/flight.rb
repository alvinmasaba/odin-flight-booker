class Flight < ApplicationRecord
  validates :date, :duration, presence: true

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.search(search)
    Flight.where("departure_airport_id = ? OR arrival_airport_id = ? OR date = ?", search[:departure_airport_id], 
                                                                                   search[:arrival_airport_id], 
                                                                                   (search[:date].to_datetime if search[:date]))
  end

  def flight_date
    self.date.strftime("%B %-d, %Y") # Verbose 'Month, Day'
  end
end

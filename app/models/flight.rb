class Flight < ApplicationRecord
  validates :date, :duration, presence: true

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :passengers, through: :bookings, inverse_of: :flight, dependent: :destroy

  def self.search(search)
    Flight.where("departure_airport_id = ? OR arrival_airport_id = ? OR date = ?", search[:departure_airport_id], 
                                                                                   search[:arrival_airport_id], 
                                                                                   (search[:date] if search[:date]))
  end

  def flight_date
    self.date.strftime("%B %-d, %Y") # Verbose 'Month, Day'
  end

  def flight_time
    self.date.strftime("%I:%M %p") # Hour:Minute AM/PM
  end

  def as_json(options={})
    super(:except => [:date, :updated_at, :created_at])
  end
end

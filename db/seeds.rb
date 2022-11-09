puts "Seeding airports and flights..."

AIRPORTS = ["YYZ", "LAX", "LHR", "ATL", "DFW", "DEN", "ORD", "MCO", "CAN",
            "CTU", "LAS", "PHX", "MIA", "DEL", "IST", "SZX", "MEX", "CDG",
            "HND", "AMS", "CJU", "DME", "FRA", "GRU", "CUN", "AYT", "SLC",
            "MAD", "GMP", "FLL"]

Airport.delete_all
Flight.delete_all
Booking.delete_all

AIRPORTS.each do |airport|
  Airport.create(code: airport)
end

100.times do |i|
  depart = Airport.all.sample
  arrive = Airport.all.sample
  date = rand(1.years).seconds.from_now.to_datetime

  until depart != arrive
    arrive = Airport.all.sample
  end

  Flight.create(departure_airport: depart, arrival_airport: arrive, date: date, duration: rand(1..20))
end

puts "Seeding complete."

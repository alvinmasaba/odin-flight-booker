puts "Seeding airports and flights..."

AIRPORTS = ["YYZ", "LAX", "LHR", "ATL", "DFW", "DEN", "ORD", "MCO", "CAN",
            "CTU", "LAS", "PHX", "MIA", "DEL", "IST", "SZX", "MEX", "CDG",
            "HND", "AMS", "CJU", "DME", "FRA", "GRU", "CUN"]

Airport.delete_all
Flight.delete_all

AIRPORTS.each do |airport|
  Airport.create(code: airport)
end

10.times do |i|
  airports = Airport.order('RANDOM()')

  month = (1..12).to_a.sample
  day = (1..28).to_a.sample
  date = DateTime.new(2023, month, day).midday

  Flight.create(departure_airport: airports.first, arrival_airport: airports.second, date: date, duration: (1..20).to_a.sample)
end

puts "Seeding complete."

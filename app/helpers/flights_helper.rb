module FlightsHelper
  def display_flight_info(flight)
    "#{flight.origin} ➡️ #{flight.destination}"
  end
end

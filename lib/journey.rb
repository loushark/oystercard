class Journey

  attr_reader :current_journey

  def initialize
    @current_journey = { entry: nil, exit: nil }
  end

  def start_journey(entry_station)
    @current_journey[:entry] = entry_station
    "Journey started."
  end
end

class Journey

  attr_reader :current_journey

  def initialize
    @current_journey = { entry: nil, exit: nil }
  end

  def start_journey(entry_station)
    @current_journey[:entry] = entry_station
    "Journey started."
  end

  def end_journey(exit_station)
    @current_journey[:exit] = exit_station
  end

  def in_journey?
    current_journey[:entry] != nil ? true : false
  end

end

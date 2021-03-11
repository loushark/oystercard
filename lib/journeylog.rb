
class JourneyLog

  def initialize
    @journey_class = Journey.new
    @journey = nil
  end

  def start_journey(entry_station)
    @journey = @journey_class
    @journey.start_journey(entry_station)
  end

end

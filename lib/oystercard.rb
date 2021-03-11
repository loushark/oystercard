class Oystercard

attr_accessor :balance, :entry_station, :history, :journey
DEFAULT_BALANCE = 90
# MINIMUM_FARE = 1
# COMPLETE_JOURNEY = { entry: nil, exit: nil }

  def initialize
    @balance = 0
    @history = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Balance exceeds limit of £#{DEFAULT_BALANCE}" if (@balance + amount) > DEFAULT_BALANCE
    @balance += amount
  end

  def in_journey?
    @journey.in_journey?
  end

  def touch_in(station)
    raise "Insufficient funds on card" if @balance < Journey::MINIMUM_FARE
    @journey.start_journey(station)
  end

  def touch_out(station)
    deduct(@journey.fare)
    @journey.end_journey(station)
    journey_to_history
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def journey_to_history
    @history << @journey
    @journey = Journey.new
  end

end

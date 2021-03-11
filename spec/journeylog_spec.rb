require 'journeylog'

describe JourneyLog do
  let(:test_journeylog) { JourneyLog.new}
  let(:entry_station) { double(:station) }
  # let(:test_journey) { double(:journey, entry: entry_station)}


  describe '#start_journey' do
    it 'will create a new journey instance and set the entry station to the touch in station' do
      expect(test_journeylog.start_journey(entry_station)).to eq entry_station
    end
  end
end

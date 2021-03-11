require 'journey'

describe Journey do
  let(:test_journey) { Journey.new }
  let(:entry_station) { double(:Station, name: "Victoria")}
  let(:exit_station) { double(:Station, name: "Hammersmith")}

  describe "#start_journey" do
    it "starts a journey" do
      expect(test_journey.start_journey(entry_station)).to eq "Journey started."
    end
  end

  describe "#current_journey" do
    context "it has touched in but not touched out" do
      it "gives status of current_journey" do
        test_journey.start_journey(entry_station)
        expect(test_journey.current_journey).to eq ({ entry: entry_station, exit: nil })
      end
    end

    context "it has touched in and touched out" do
      it "gives status of current_journey" do
        test_journey.start_journey(entry_station)
        test_journey.end_journey(exit_station)
        expect(test_journey.current_journey).to eq({ entry: entry_station, exit: exit_station })
      end
    end
  end

  describe "#in_journey?" do
    it "returns true when in_journey" do
      test_journey.start_journey(entry_station)
      # expect(test_journey.in_journey?).to eq(true)
      expect(test_journey).to be_in_journey
    end
  end

end


# expect { article.publish }.to change(Article, :count).by(1)

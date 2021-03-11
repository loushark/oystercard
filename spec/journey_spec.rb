require 'journey'

describe Journey do
  let(:test_journey) { Journey.new }
  let(:entry_station) { double(:Station, name: "Victoria")}

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
  end
end


# expect { article.publish }.to change(Article, :count).by(1)

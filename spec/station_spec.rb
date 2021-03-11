require 'station'

describe Station do
let(:station) { Station.new("Hackney", 2)}

  # it "prints station name" do
  #   hackney = double(:station1, :name => "Hackney", :zone => 2)
  #
  #   expect(hackney.name).to eq "Hackney"
  # end

  it "provides a name" do
    expect(station).to respond_to(:name)
  end

  it "provides a zone" do
    expect(station).to respond_to(:zone)
  end

  it "tells us the staion is in zone 2" do
    allow(station).to receive(:zone).and_return(5)
    expect(station.zone).to eq 5
  end
end

require 'oystercard'

describe Oystercard do
alias_method :card, :subject
let(:station) { double('Hackney') }
let(:station2) { double('Moorgate') }
let(:minimum_fare) { 1 }
# stub_const("MINIMUM_FARE", 1)

  it "Checking balance on card" do
    expect(card).to respond_to(:balance)
  end

  it "responds to top up" do
    expect(card).to respond_to(:top_up)
  end
  it "top_up amends the balance" do
    card.top_up(5)
    expect(card.balance).to eq 5
  end

  it "throws an error if balance exceeds limit" do
    expect { card.top_up(95) }.to raise_error "Balance exceeds limit of £#{Oystercard::DEFAULT_BALANCE}"
  end

  # Removed tests because "deduct" method is private

  #it "responds to deduct" do
  #  expect(card).to respond_to(:deduct)
  #end

  #it "it deducts money from the balance" do
  #  card.top_up(20)
  #  card.deduct(10)
  #  expect(card.balance).to eq 10
  #end

  it "knows when it's in_journey" do
    expect(card).not_to be_in_journey
  end

  it "responds to touch in" do
    expect(card).to respond_to(:touch_in)
  end

  it "changes in_journey to true when touch_in" do
    card.top_up(minimum_fare)
    card.touch_in(station)
    expect(card.in_journey?).to eq(true)
  end

  it "responds to touch_out" do
    expect(card).to respond_to(:touch_out)
  end

  it "changes in_journey to false when touch_out" do
    card.top_up(minimum_fare)
    card.touch_in(station)
    card.touch_out(station2)
    expect(card.in_journey?).to eq false
  end

  it "throws an error if insufficient balance on card" do
    expect { card.touch_in("Hackney") }.to raise_error "Insufficient funds on card"
  end

  it "reduces the balance by the minimum fare on touch_out" do
    card.top_up(minimum_fare)
    card.touch_in(station)
    expect { card.touch_out(station2) }.to change { card.balance }.by(-minimum_fare)
  end

  context "remembering stations" do
    let(:test_journey) { instance_double("Journey", current_journey: { entry: nil, exit: nil } )}

    before do
      card.top_up(20)
      card.touch_in(station)
    end

    it "remembers the touch_in station" do
      expect(card.journey.current_journey[:entry]).to eq(station)
    end

     it "resets entry_station to nil on touch_out" do
       card.touch_out(station2)
       expect(card.entry_station).to eq(nil)
     end

     it "stores one completed journey history" do
       card.touch_out(station2)
       expect(card.history[0].current_journey).to eq({ entry: station, exit: station2 })
     end

     it "resets journey when touched out" do
       card.touch_out(station2)
       expect(card.journey.current_journey).to eq({ entry: nil, exit: nil })
     end

   end

   it "returns an empty history when card is new" do
     expect(card.history).to eq []
   end
end


# card = Card.new
# card.add_money(20)
# card.touch_in(hammersmith)
# card.touch_out(cockfosters)
# card.balance
# station["station name"] returns zone

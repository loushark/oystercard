In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

Challenge 14

it should be responsible for:
- x starting a journey,
- x finishing a journey,
- x calculating the fare of a journey,
- x returning whether or not the journey is complete.

- [x] Write up a plan for how you will interact with your code and manually test in IRB.
- [x] Update your test suite to reflect a new Journey class
- [x] Create a new class Journey and move the functionality that relates to x journey from Oystercard to Journey
- [x] Make sure all tests pass, all existing functionality is preserved
- [x] The `#fare` method should return the minimum fare (for the moment), or the penalty fare of 6 if there was either no entry station or no  exit station.
- [x] Make sure the entire codebase is DRY
- [x] Make sure all methods are three lines or shorter

Challenge 15

It should be responsible for
 - starting a journey
 - ending a journey
 - current_journey
 - returning a list of journeys.
 - journey_class

- [ ] Write up a plan for how you will interact with your code and manually test in IRB.
- [ ] test drive the development of `JourneyLog` class
- [ ] Initialise the `JourneyLog` with a `journey_class` parameter (hint: `journey_class` expects an object that knows how to create `Journey`s.  Can you think of an object that already does this?)
- [ ] `#start` should start a new journey with an entry station
- [ ] a private method `#current_journey` should return an incomplete journey or create a new journey
- [ ] `#finish` should add an exit station to the `current_journey`
- [ ] `#journeys` should return a list of all previous journeys without exposing the internal array to external modification
- [ ] remove redundant code from OysterCard class



| Object        | Message                     | Methods                  |
| ------------- | --------------------------- | ------------------------ |
| Card          | Add money (up to limit)     | add_money(money)         |
|               | How much on card?           | balance                  |  
|               | Touch in                    | touch_in(station)        |
|               | Touch out                   | touch_out(station)       |
|               | Deduct fare on touch out    | journey_fare(fare)       |
|               | Penalty if no touch out     | penalty                  |
| Zones         | Stations                    | Hash                     |

card = Card.new
card.add_money(20)
card.touch_in(hammersmith)
card.touch_out(cockfosters)
card.balance
station["station name"] returns zone

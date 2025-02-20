![language-ruby](https://img.shields.io/badge/language-ruby-red) ![version-2.6.5](https://img.shields.io/badge/version-2.6.5-yellow) ![coverage-score](https://img.shields.io/badge/coverage-100%-blue) ![build](https://img.shields.io/badge/build-passing-brightgreen)


Airport Challenge
=================

## How to run

1. Clone this repo: `git clone https://github.com/acavalla/airport_challenge.git`
2. To run the test suite, run `rspec`
2. Open the Ruby REPL `irb -r runfile.rb`. Please see below for demo of functionality.

```
        ______
        _\____\___
=  = ==(____AA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
This is my solution to the weekend airport challenge. I have satisfied the below user stories. Please see below for an irb test-drive.

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

I did this by test driving the creation of a set of classes to satisfy all the above user stories. I used sample to set the weather (it is normally sunny but on rare occasions it may be stormy) and stubbed it in the test suite.

```Ruby
$ irb
2.6.5 :001 > airport = Airport.new
 => #<Airport:0x00007fecbc96a4f0 @capacity=20, @planes=[], @weather=#<Weather:0x00007fecbc96a4c8>>
2.6.5 :002 > plane = Plane.new
 => #<Plane:0x00007fecbc96f568 @grounded=false>
2.6.5 :003 > airport.land(plane)
 => [#<Plane:0x00007fecbc96f568 @grounded=true>]
2.6.5 :004 > airport.takeoff(plane)
Traceback (most recent call last):

        7: from /Users/annie/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        6: from /Users/annie/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        5: from /Users/annie/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        4: from (irb):4
        3: from /Users/annie/MakersProjs/weekend-challenges/airport_challenge/lib/airport_challenge.rb:28:in `takeoff'
        2: from /Users/annie/MakersProjs/weekend-challenges/airport_challenge/lib/airport_challenge.rb:34:in `takeoff_safety_check'
        1: from /Users/annie/MakersProjs/weekend-challenges/airport_challenge/lib/airport_challenge.rb:43:in `weather_check'
RuntimeError (Too stormy.)
```
The code throws errors for edge cases, like trying to land a plane that's already landed in any airport, trying to take off a plane that's not in the airport, and trying to take off a plane that's in the air already.

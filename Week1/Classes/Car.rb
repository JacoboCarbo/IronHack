class Car
    attr_reader :sound
    def initialize(sound)
        @sound = sound

    end

    def make_sound
        puts @sound
    end
end

bmw = Car.new("Braaam!")
mercedes = Car.new("Brooom!")
ferrari = Car.new("Briiim!")


sounds= ["Braaam!", "Brooom!", "Briiim!"]
cars = [bmw, mercedes, ferrari]

all_sounds = cars.reduce("") do |memo, car|
    memo += " " + car.sound
end

puts all_sounds


#cars = sounds.map do |sound|
#    Car.new(sound)
#end

#cars.each do |car|
#    car.make_sound
#end

#cars = sounds.each_with_object({}) do |sound, memo|
#    memo[sound] = Car.new(sound).class
#end

#puts cars


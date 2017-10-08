# This is for practicing Sandi Metz's bicycle example from her POODR book.
# Object Oriented Design of a bike
# Please see all commits to understand the stages of building this code

# Nouns are great candidates for classes: bike, gear
class Gear
    attr_reader :chainring, :cog

    def initialize(chainring, cog)
        @chainring = chainring
        @cog = cog
    end

    def ratio
        chainring / cog.to_f
    end
end

puts Gear.new(52, 11).ratio
puts Gear.new(30, 27).ratio


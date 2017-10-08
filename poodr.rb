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

  def gear_inches(diameter)
    ratio * diameter
  end
end

class Wheel
  attr_reader :rim, :tire, :gear
  def initialize(rim, tire, chainring, cog)
    @rim = rim
    @tire = tire
    @gear = Gear.new(chainring, cog)
  end

  def diameter
    rim + (tire * 2)
  end

  def gear_inches
    gear.gear_inches(diameter)
  end

  def circumference
    diameter * Math::PI
  end
end

puts Wheel.new(26, 1.5, 52, 11).gear_inches

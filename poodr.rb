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

# puts Wheel.new(26, 1.5, 52, 11).gear_inches

class Trip
  attr_reader :bicycles, :customers, :vehicle

  # this 'mechanic' argument could be of any class
  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
  end
end

class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each {|bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)
    #...
  end
end

class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size  = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

require 'forwardable'
class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable

  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    select {|part| part.needs_spare }
  end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name        = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end
end

module PartsFactory
  def self.build(config,
                 part_class = Part,
                 parts_class = Parts)
  end
end

chain         = Part.new(name: 'chain', description: '10-speed')
road_tire     = Part.new(name: 'tire_size', description: '23')
mountain_tire = Part.new(name: 'tire_size', description: '2.1')
tape          = Part.new(name: 'tape_color', description: 'red')
rear_shock    = Part.new(name: 'rear_shock', description: 'Fox')
front_shock   = Part.new(name: 'front_shock', description: 'Manitou', needs_spare: false)

road_bike = Bicycle.new(size: 'L', parts: Parts.new([chain, road_tire, tape, rear_shock]))
p road_bike
p road_bike.spares.size
p road_bike.parts.size

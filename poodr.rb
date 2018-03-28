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

class Parts
  attr_reader :parts

  def initialize(parts)
    @parts = parts
    # @chain     = args[:chain]     || default_chain
    # @tire_size = args[:tire_size] || default_tire_size
    # post_initialize(args)
  end

  def spares
    parts.select {|part| part.needs_spare }
    # { tire_size: tire_size,
    #   chain:     chain }.merge(local_spares)
  end

  # def post_initialize(args)
  #   nil
  # end

  # def default_chain
  #   '10-speed'
  # end

  # def default_tire_size
  #   raise NotImplementedError
  # end

  # def local_spares
  #   {}
  # end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name        = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end
end

class RoadBikeParts < Parts
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    { tape_color: tape_color }
  end

  def default_tire_size
    '23'
  end
end

class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  def default_tire_size
    '2.1'
  end

  def local_spares
    { front_shock: front_shock,
      rear_shock:  rear_shock }
  end
end

class RecumbentBikeParts < Parts
  attr_reader :flag

  def post_initialize(args)
    @flag = args[:flag]
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end

  def local_spares
    { flag: flag }
  end
end

chain         = Part.new(name: 'chain', description: '10-speed')
road_tire     = Part.new(name: 'tire_size', description: '23')
mountain_tire = Part.new(name: 'tire_size', description: '2.1')
tape          = Part.new(name: 'tape_color', description: 'red')
rear_shock    = Part.new(name: 'rear_shock', description: 'Fox')
front_shock   = Part.new(name: 'front_shock', description: 'Manitou', needs_spare: false)

road_bike = Bicycle.new(size: 'L', parts: Parts.new([chain, road_tire, tape]))
p road_bike.spares

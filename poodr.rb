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
  attr_reader :size, :chain, :tire_size

  def initialize(args)
    @size      = args[:size]
    @chain     = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError
  end

  def spares
    { tire_size: tire_size,
      chain: chain }
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def default_tire_size
    '23'
  end

  def spares
    super.merge({ tape_color: tape_color })
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def default_tire_size
    '2.1'
  end

  def spares
    super.merge({ front_shock: front_shock,
                  rear_shock:  rear_shock })
  end
end

class RecumbentBike < Bicycle
  attr_reader :flag

  def initialize(args)
    @flag = args[:flag]
    super(args)
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end

  def spares
    super.merge({ flag: flag })
  end
end

# bike = RoadBike.new(style: :road, size: 'S', tape_color: 'red')
# p bike.spares
p RecumbentBike.new(size: 'S')

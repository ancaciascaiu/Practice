# build a crossroad intersection where the stoplights
# change colors in this order: Green-Yellow-Red.

class Intersection
  def initialize
    @stoplight1 = StopLight.new
    @stoplight2 = StopLight.new
  end
end

class StopLight
  def initialize
    @red    = true
    @yellow = false
    @green  = false
  end
end

p Intersection.new
# build a crossroad intersection where the stoplights
# change colors in this order: Green-Yellow-Red.

class Intersection
  attr_reader :stoplight1, :stoplight2

  def initialize
    @stoplight1 = StopLight.new
    @stoplight2 = StopLight.new
  end

  def run
    loop do
      # to start
      if stoplight1.red && stoplight2.red
        stoplight1.red = false
        stoplight1.green = true
        p stoplight1
        p stoplight2
      elsif stoplight1.green
        stoplight1.green = false
        stoplight1.yellow = true
        p stoplight1
        p stoplight2
        # wait
        stoplight1.yellow = false
        stoplight1.red = true
        stoplight2.red = false
        stoplight2.green = true
        p stoplight1
        p stoplight2
      elsif stoplight2.green
        stoplight2.green = false
        stoplight2.yellow = true
        p stoplight1
        p stoplight2
        # wait
        stoplight2.yellow = false
        stoplight2.red = true
        stoplight1.red = false
        stoplight1.green = true
        p stoplight1
        p stoplight2
      end
    end
  end
end

class StopLight
  attr_accessor :red, :yellow, :green

  def initialize
    @red    = true
    @yellow = false
    @green  = false
  end
end

Intersection.new.run

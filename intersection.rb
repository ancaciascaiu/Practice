# build a crossroad intersection where the stoplights
# change colors in this order: Green-Yellow-Red.

class Intersection
  attr_reader :stoplight1, :stoplight2

  def initialize
    @stoplight1 = StopLight.new(red: true, yellow: false, green: false)
    @stoplight2 = StopLight.new(red: false, yellow: false, green: true)
  end

  def run
    loop do
      if stoplight1.green
        stoplight1.green = false
        stoplight1.yellow = true
        p stoplight1
        p stoplight2
        sleep(15)
        p "----------------"
        stoplight1.yellow = false
        stoplight1.red = true
        stoplight2.red = false
        stoplight2.green = true
        p stoplight1
        p stoplight2
        sleep(15)
        p "----------------"
      elsif stoplight2.green
        stoplight2.green = false
        stoplight2.yellow = true
        p stoplight1
        p stoplight2
        sleep(15)
        p "----------------"
        stoplight2.yellow = false
        stoplight2.red = true
        stoplight1.red = false
        stoplight1.green = true
        p stoplight1
        p stoplight2
        sleep(15)
        p "----------------"
      end
    end
  end
end

class StopLight
  attr_accessor :red, :yellow, :green

  def initialize(red:, yellow:, green:)
    @red    = red
    @yellow = yellow
    @green  = green
  end
end

Intersection.new.run

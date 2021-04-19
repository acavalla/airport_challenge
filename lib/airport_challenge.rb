require_relative "plane"
require_relative 'weather'

class Airport
  DEF_CAPACITY = 20

  attr_reader :planes

  def initialize(capacity = DEF_CAPACITY, weather: Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    landing_safety_check(plane)
    plane.land
    planes << plane
  end

  def landing_safety_check(plane)
    weather_check
    plane_landed(plane)
    full_airport
  end

  def takeoff(plane)
    takeoff_safety_check(plane)
    planes.delete(plane)
    plane.takeoff
  end

  def takeoff_safety_check(plane)
    weather_check
    raise "Plane in air." unless landed?(plane)
    raise "Plane not in airport." unless present?(plane)
  end

  private
  attr_reader :capacity, :weather

  def weather_check
    raise "Too stormy." if weather.stormy?
  end

  def plane_landed(plane)
    raise "Plane grounded elsewhere." if landed?(plane)
  end

  def full_airport
    raise "This airport is full." if full?
  end

  def full?
    planes.length == capacity
  end

  def present?(plane)
    planes.include?(plane)
  end

  def landed?(plane)
    plane.grounded?
  end
end

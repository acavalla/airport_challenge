require_relative "plane"
require_relative 'weather'

class Airport
  DEF_CAPACITY = 20

  attr_reader :capacity, :weather, :planes

  def initialize(capacity = DEF_CAPACITY, weather: Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Too stormy." if weather.stormy?
    landing_safety_check(plane)
    planes << plane
  end

  def landing_safety_check(plane)
    plane_landed(plane)
    full_airport
  end

  def plane_landed(plane)
    raise "Plane grounded elsewhere." if landed?(plane)
  end

  def full_airport
    raise "This airport is full." if full?
  end

  def takeoff(plane)
    # takeoff_safety_check(plane)
    raise "Too stormy." if weather.stormy?
    raise "Plane in air." unless landed?(plane)
    raise "Plane not in airport." unless present?(plane)
    planes.delete(plane)
    plane.takeoff
  end

  def takeoff_safety_check(plane)
    storm_safety
    fly_safety(plane)
    absent_plane(plane)
  end

  private
  attr_writer :planes

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

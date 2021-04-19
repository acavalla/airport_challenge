class Plane
  def initialize
    @grounded = false
  end

  def land
    @grounded = true
  end

  def takeoff
    @grounded = false
  end

  def grounded?
    @grounded
  end
end

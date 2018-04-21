class Team
  attr_accessor :active, :drivers, :constructor, :cost, :turbo, :points

  def initialize(drivernumbers, constructornumber)
    @active = true
    @drivers = []
    @points = 0

    drivernumbers.each do |drivernumber|
      tempdriver = Driver.new(drivernumber)
      @drivers.push tempdriver
    end

    @constructor = Constructor.new(constructornumber)
    is_under_cost_threshold
    calculate_turbo_driver
    calculate_points
  end

  private

  def is_under_cost_threshold
    threshold = 100

    drivercost = 0
    teamcost = @constructor.cost

    @drivers.each do |driver|
      drivercost += driver.cost
    end

    @cost = drivercost + teamcost

    if @cost > threshold
      @active = false
    end
  end

  def calculate_points
    drivers.each do |driver|
      @points += driver.points
    end

    @points += @constructor.points
    @points += @turbo.averagepointsperrace
  end

  def calculate_turbo_driver
    @turbo = nil
    turbopoints = -9999999
    @drivers.each do |driver|
      if driver.averagepointsperrace > turbopoints
        @turbo = driver
        turbopoints = driver.averagepointsperrace
      end
    end
  end






end
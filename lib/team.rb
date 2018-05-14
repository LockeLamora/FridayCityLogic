class Team
  attr_accessor :active, :drivers, :constructor, :cost, :turbo, :points, :out, :in

  def initialize(data, drivernames, constructorname)
    @active = true
    @drivers = []
    @points = 0

    drivernames.each do |drivername|
      tempdriver = Driver.new(data.get_driver(drivername), drivername)
      @drivers.push tempdriver
    end

    @constructor = Constructor.new(data.get_constructor(constructorname), constructorname)
    is_under_cost_threshold
    if @active
      calculate_turbo_driver
      calculate_points
    end

  end

  def set_out(teamout)
    @out = teamout[0]
    if @out.nil?
      @out = 'N/A'
    end
  end

  def set_in(teamin)
    @in = teamin[0]
    if @in.nil?
      @in = 'N/A'
    end
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

    @cost = @cost.round(2)
    if @cost > threshold
      @active = false
    end
  end

  def calculate_points
    drivers.each do |driver|
      @points += driver.averagepointsperrace
    end

    @points += @constructor.averagepointsperrace
    @points += @turbo.averagepointsperrace
  end

  def calculate_turbo_driver
    @turbo = nil
    turbopoints = -9999999
    @drivers.each do |driver|
      if driver.averagepointsperrace > turbopoints and driver.cost <= 19
        @turbo = driver
        turbopoints = driver.averagepointsperrace
      end
    end
  end
  
end
class Driver
  attr_accessor :cost, :name, :averagepointsperrace

  def initialize(driverdata, name)
    @name = name
    if @name
      populate_driver(driverdata)
    end
  end
  private

  def populate_driver(driverdata)
    @cost = driverdata['cost']
    points = driverdata['points_history'].inject(0){|sum,x| sum + x }
    @averagepointsperrace = points / driverdata['points_history'].length
  end

end
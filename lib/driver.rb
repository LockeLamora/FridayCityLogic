class Driver
  attr_accessor :cost, :name, :averagepointsperrace, :past_avg_points

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
    race_count = driverdata['points_history'].length
    @averagepointsperrace = race_count == 0 ? 0 : points / race_count

    if driverdata['2018_points_history'].nil?
      @past_avg_points = 0 
    else
      past_points = driverdata['2018_points_history'].inject(0) { |s, x| s + x }
      @past_avg_points = past_points / 21
    end
  end

end

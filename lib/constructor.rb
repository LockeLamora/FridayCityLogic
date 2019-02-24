class Constructor
  attr_accessor :cost, :name, :averagepointsperrace, :past_avg_points

  def initialize(constructordata, name)
    @name = name
    populate_constructor(constructordata)
  end

  private

  def populate_constructor(constructordata)
    @cost = constructordata['cost']
    points = constructordata['points_history'].inject(0){|sum,x| sum + x }
    past_points = constructordata['2018_points_history'].inject(0) { |sum, x| sum + x }
    race_count = constructordata['points_history'].length
    @averagepointsperrace = race_count == 0 ? 0 : points / race_count
    @past_avg_points = past_points / 21
  end

end

class Constructor
  attr_accessor :cost, :name, :averagepointsperrace

  def initialize(constructordata, name)
    @name = name
    populate_constructor(constructordata)
  end

  private

  def populate_constructor(constructordata)
    @cost = constructordata['cost']
    points = constructordata['points_history'].inject(0){|sum,x| sum + x }
    @averagepointsperrace = points / constructordata['points_history'].length
  end

end
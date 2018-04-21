class Constructor
  attr_accessor :cost, :name, :points

  def initialize(constructornumber)
    populate_name_and_cost(constructornumber)
    populate_points
  end

  private
  def populate_name_and_cost(constructornumber)
    case constructornumber
    when 1
      @cost = 30
      @name = 'Mercedes'
    when 2
      @cost = 27.5
      @name = 'Ferrari'
    when 3
      @cost = 20
      @name = 'RedBull'
    when 4
      @cost = 10.5
      @name = 'Force India'
    when 5
      @cost = 9
      @name = 'Williams'
    when 6
      @cost = 9.7
      @name = 'Renault'
    when 7
      @cost = 7.8
      @name = 'Toro Rosso'
    when 8
      @cost = 5.5
      @name = 'Haas'
    when 9
      @cost = 9.5
      @name = 'McLaren'
    when 10
      @cost = 5
      @name = 'Sauber'
    end
  end

  def populate_points
    @points = 0
  end
end
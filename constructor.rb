class Constructor
  attr_accessor :cost, :name, :points

  def initialize(constructornumber)
    populate_constructor(constructornumber)
  end

  private

  def populate_constructor(constructornumber)
    numraces = 3
    case constructornumber
    when 1
      @cost = 30
      @name = 'Mercedes'
      @points = 215
    when 2
      @cost = 27.5
      @name = 'Ferrari'
      @points = 207
    when 3
      @cost = 20
      @name = 'RedBull'
      @points = 139
    when 4
      @cost = 10.5
      @name = 'Force India'
      @points = 57
    when 5
      @cost = 9
      @name = 'Williams'
      @points = 40
    when 6
      @cost = 9.7
      @name = 'Renault'
      @points = 94
    when 7
      @cost = 7.8
      @name = 'Toro Rosso'
      @points = 46
    when 8
      @cost = 5.5
      @name = 'Haas'
      @points = 51
    when 9
      @cost = 9.5
      @name = 'McLaren'
      @points = 130
    when 10
      @cost = 5
      @name = 'Sauber'
      @points = 79
    end

    @points /= numraces.to_f
  end

end
class Constructor
  attr_accessor :cost, :name, :points

  def initialize(constructornumber=nil)
    if constructornumber
      populate_constructor(constructornumber)
    end
  end

  def name_to_number(name)
    case name.downcase.strip
    when 'mercedes'
      return 1
    when 'ferrari'
      return 2
    when 'redbull'
      return 3
    when 'force india'
      return 4
    when 'williams'
      return 5
    when 'renault'
      return 6
    when 'toro rosso'
      return 7
    when 'haas'
      return 8
    when 'mclaren'
      return 9
    when 'sauber'
      return 10
    else
      puts 'cannot read constructor name:' + name
    end
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
      @cost = 28
      @name = 'Ferrari'
      @points = 207
    when 3
      @cost = 19
      @name = 'RedBull'
      @points = 139
    when 4
      @cost = 11
      @name = 'Force India'
      @points = 57
    when 5
      @cost = 8.7
      @name = 'Williams'
      @points = 40
    when 6
      @cost = 9.9
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
      @cost = 9.7
      @name = 'McLaren'
      @points = 130
    when 10
      @cost = 5.7
      @name = 'Sauber'
      @points = 79
    end

    @points /= numraces.to_f
  end

end
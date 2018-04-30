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
      return 991
    when 'ferrari'
      return 992
    when 'red bull'
      return 993
    when 'force india'
      return 994
    when 'williams'
      return 995
    when 'renault'
      return 996
    when 'toro rosso'
      return 997
    when 'haas'
      return 998
    when 'mclaren'
      return 999
    when 'sauber'
      return 1000
    else
      puts 'cannot read constructor name:' + name
    end
  end

  private

  def populate_constructor(constructornumber)
    numraces = 3
    case constructornumber
    when 991
      @cost = 30
      @name = 'Mercedes'
      @points = 215
    when 992
      @cost = 28
      @name = 'Ferrari'
      @points = 207
    when 993
      @cost = 19
      @name = 'Red Bull'
      @points = 139
    when 994
      @cost = 11
      @name = 'Force India'
      @points = 57
    when 995
      @cost = 8.7
      @name = 'Williams'
      @points = 40
    when 996
      @cost = 9.9
      @name = 'Renault'
      @points = 94
    when 997
      @cost = 7.8
      @name = 'Toro Rosso'
      @points = 38
    when 998
      @cost = 5.5
      @name = 'Haas'
      @points = 51
    when 999
      @cost = 9.7
      @name = 'McLaren'
      @points = 126
    when 1000
      @cost = 5.7
      @name = 'Sauber'
      @points = 71
    end

    @points /= numraces.to_f
  end

end
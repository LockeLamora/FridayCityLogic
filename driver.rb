class Driver
  attr_accessor :cost, :name, :number, :points

  def initialize(number)
    @number = number
    get_cost_and_name
  end

  private

  def get_cost_and_name
    case @number
    when 1
      @cost = 11.5
      @name = 'Alonso'
      @points = 76
    when 2
      @cost = 25.3
      @name = 'Bottas'
      @points = 93
    when 3
      @cost = 5.5
      @name = 'Ericsson'
      @points = 20
    when 4
      @cost = 7.5
      @name = 'Gasly'
      @points = 18
    when 5
      @cost = 6.5
      @name = 'Grosjean'
      @points = -3
    when 6
      @cost = 29.8
      @name = 'Hamilton'
      @points = 94
    when 7
      @cost = 6.5
      @name = 'Hartley'
      @points = -4
    when 8
      @cost = 12
      @name = 'Hulkenberg'
      @points = 63
    when 9
      @cost = 4.5
      @name = 'Leclerc'
      @points = 31
    when 10
      @cost = 7.5
      @name = 'Magnussen'
      @points = 29
    when 11
      @cost = 11.3
      @name = 'Ocon'
      @points = 23
    when 12
      @cost = 12
      @name = 'Perez'
      @points = 10
    when 13
      @cost = 20
      @name = 'Raikonnen'
      @points = 54
    when 14
      @cost = 20.5
      @name = 'Ricciardo'
      @points = 76
    when 15
      @cost = 9.5
      @name = 'Sainz'
      @points = 20
    when 16
      @cost = 7.5
      @name = 'Sirotkin'
      @points = 2
    when 17
      @cost = 8.5
      @name = 'Stroll'
      @points = 35
    when 18
      @cost = 8
      @name = 'Vandoorne'
      @points = 31
    when 19
      @cost = 19.7
      @name = 'Verstappen'
      @points = 26
    when 20
      @cost = 28
      @name = 'Vettel'
      @points = 98
    end
  end

end
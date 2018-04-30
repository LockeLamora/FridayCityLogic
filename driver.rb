class Driver
  attr_accessor :cost, :name, :number, :points, :averagepointsperrace

  def initialize(number=nil)
    @number = number
    if @number
      populate_driver
    end
  end

  def name_to_number(name)
    case name.downcase.strip
    when 'alonso'
      return 1
    when 'bottas'
      return 2
    when 'ericsson'
      return 3
    when 'gasly'
      return 4
    when 'grosjean'
      return 5
    when 'Hamilton'
      return 6
    when 'Hartley'
      return 7
    when 'hulkenberg'
      return 8
    when 'leclerc'
      return 9
    when 'magnussen'
      return 10
    when 'ocon'
      return 11
    when 'perez'
      return 12
    when 'raikonnen'
      return 13
    when 'ricciardo'
      return 14
    when 'sainz'
      return 15
    when 'sirotkin'
      return 16
    when 'stroll'
      return 17
    when 'vandoorne'
      return 18
    when 'verstappen'
      return 19
    when 'vettel'
      return 20
    else
      puts 'cannot read driver name:'+name
    end
  end

  private

  def populate_driver
    numraces = 3
    costthreshold = 19
    case @number
    when 1
      @cost = 11.8
      @name = 'Alonso'
      @points = 76
      history = [28, 24, 24, 24]
    when 2
      @cost = 24.4
      @name = 'Bottas'
      @points = 93
      history = [19, 37, 37, 7]
    when 3
      @cost = 5.5
      @name = 'Ericsson'
      @points = 20
      history = [-12, 19, 13, 12]
    when 4
      @cost = 7.2
      @name = 'Gasly'
      @points = 18
      history = [-14, 28, 4, 14]
    when 5
      @cost = 6.3
      @name = 'Grosjean'
      @points = -3
      history = [-8, 8, -3, -20]
    when 6
      @cost = 30.1
      @name = 'Hamilton'
      @points = 94
      history = [35, 36, 23, 45]
    when 7
      @cost = 6.6
      @name = 'Hartley'
      @points = -4
      history = [9, -2, -11, 10]
    when 8
      @cost = 11.5
      @name = 'Hulkenberg'
      @points = 63
      history = [18, 22, 23, -8]
    when 9
      @cost = 5.5
      @name = 'Leclerc'
      @points = 31
      history = [15, 12, 4, 26]
    when 10
      @cost = 7.4
      @name = 'Magnussen'
      @points = 29
      history = [-5, 25, 9, 12]
    when 11
      @cost = 10.7
      @name = 'Ocon'
      @points = 23
      history = [7, 8, 8, -6]
    when 12
      @cost = 12.6
      @name = 'Perez'
      @points = 10
      history = [10, -1, 1, 35]
    when 13
      @cost = 20.4
      @name = 'Raikonnen'
      @points = 54
      history = [28, -3, 29, 38]
    when 14
      @cost = 19.9
      @name = 'Ricciardo'
      @points = 76
      history = [33, -4, 47, -3]
    when 15
      @cost = 10.3
      @name = 'Sainz'
      @points = 20
      history = [9, 3, 8, 26]
    when 16
      @cost = 7.0
      @name = 'Sirotkin'
      @points = 2
      history = [-14, 10, 6, -13]
    when 17
      @cost = 8.7
      @name = 'Stroll'
      @points = 35
      history = [7, 15, 13, 16]
    when 18
      @cost = 8
      @name = 'Vandoorne'
      @points = 31
      history = [9, 17, 5, 14]
    when 19
      @cost = 18.9
      @name = 'Verstappen'
      @points = 26
      history = [17, -13, 22, -6]
    when 20
      @cost = 27.8
      @name = 'Vettel'
      @points = 98
      history = [44, 44, 10, 22]
    end

    if @cost <= costthreshold
      @averagepointsperrace = history.inject{ |sum, el| sum + el }.to_f / history.size
    else
      @averagepointsperrace = 0
    end

    @points /= numraces.to_f
  end

end
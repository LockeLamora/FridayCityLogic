require 'json'

class F1Data
  attr_accessor :drivers, :constructors, :budget

  def initialize()
    file = File.read('data/data.json')
    data_hash = JSON.parse(file)

    @drivers = data_hash['Drivers']
    @constructors = data_hash['Constructors']

    @budget = 100
  end

  def get_driver(driver_name)
    if !@drivers.key? driver_name.downcase
      false
    end
    @drivers["#{driver_name.downcase}"]
  end

  def get_constructor(constructor)
    if !@constructors.key? constructor.downcase
      false
    end
    @constructors["#{constructor.downcase}"]
  end

  def get_all_constructors
    @constructors
  end

  def valid_input_check(myteam)
    errors=[]
    myteam['drivers'].each do |term|
      if !get_driver(term)
        errors.push(term)
      end
    end
    if !get_constructor(myteam['constructor'])
      errors.push(myteam['constructor'])
    end

    errors
  end

  def generate_teams_list(myteam=nil)
  teams = []
  driversets = generate_driverset
  constructor_names = generate_constructorset
  unless myteam.nil?
    wholeteam = myteam['drivers'] + [myteam['constructor']]
    driver_cost = myteam['drivers'].map { |d| @drivers[d]['cost']}.inject(0) { |x,y| x+y }
    constructor_cost = @constructors[myteam['constructor']]['cost']
    budget = driver_cost + constructor_cost + (myteam['remaining_budget'] || 0)
  else
    budget = @budget
  end
  driversets.each do |driverset|
    (constructor_names).each do |constructor|
      teamtemp = Team.new(self, driverset, constructor, budget)
      arraytemp = driverset + [constructor]

      if myteam.nil?
        teams.push teamtemp
      elsif (wholeteam & arraytemp).length >= 5
        teamtemp.set_out( wholeteam - arraytemp)
        teamtemp.set_in( arraytemp - wholeteam)
        teams.push teamtemp
      end
    end
  end

  teams = teams.sort_by {|team| team.points}.reverse!
  my_team_index = teams.index { |t| t.out == 'N/A' }
  teams.slice!((my_team_index + 1)..-1) unless my_team_index.nil?
  teams
  end

  private
  def generate_driverset
    numslots = 5
    names = @drivers.keys
    names.combination(numslots).to_a
  end

  def generate_constructorset
    @constructors.keys
  end

end

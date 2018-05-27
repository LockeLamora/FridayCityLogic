require 'json'

class F1Data
  attr_accessor :drivers, :constructors, :budget

  def initialize()
    file = File.read('data/data.json')
    data_hash = JSON.parse(file)

    @drivers = data_hash['Drivers']
    @constructors = data_hash['Constructors']

    File.open('mybudget').each do |line|
      @budget = line.strip.to_f
    end
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
    myteam[0..4].each do |term|
      if !get_driver(term)
        errors.push(term)
      end
    end

    if !get_constructor(myteam[5])
      errors.push(myteam[5])
    end

    errors
  end

  def generate_teams_list(myteam=nil)
  teams = []
  driversets = generate_driverset
  constructor_names = generate_constructorset

  driversets.each do |driverset|
    (constructor_names).each do |constructor|
      teamtemp = Team.new(self, driverset, constructor, @budget)
      arraytemp = driverset + [constructor]

      if myteam.nil?
        teams.push teamtemp
      elsif (myteam & arraytemp).length >= 5
        teamtemp.set_out( myteam - arraytemp)
        teamtemp.set_in( arraytemp - myteam)
        teams.push teamtemp
      end
    end
  end

  teams.sort_by {|team| team.points}.reverse!
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
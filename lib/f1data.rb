require 'json'

class F1Data
  attr_accessor :drivers, :constructors

  def initialize()
    file = File.read('data/data.json')
    data_hash = JSON.parse(file)

    @drivers = data_hash['Drivers']
    @constructors = data_hash['Constructors']
  end

  def get_driver(driver_name)
    @drivers["#{driver_name.downcase}"]
  end

  def get_constructor(constructor)
    @constructors["#{constructor.downcase}"]
  end

  def get_all_constructors
    @constructors
  end

  def generate_teams_list(myteam=nil)
  teams = []
  driversets = generate_driverset
  constructor_names = generate_constructorset

  driversets.each do |driverset|
    (constructor_names).each do |constructor|
      teamtemp = Team.new(self, driverset, constructor)
      arraytemp = driverset + [constructor]

      if myteam.nil?
        teams.push teamtemp
      elsif (myteam & arraytemp).length >= 5
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
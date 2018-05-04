require_relative 'lib/driver'
require_relative 'lib/team'
require_relative 'lib/constructor'
require_relative 'lib/f1data'


@data = F1Data.new()

def generate_inter_change_suggestions

  if !File.exist?('myteam')
    return
  end

  myteam = []
  File.open('myteam').each do |line|
    myteam.push(line.strip)
  end

  puts 'Your current team:'
  puts myteam

  teams=[]

  driversets = generate_driverset
  constructor_names = generate_constructorset
  driversets.each do |driverset|
    (constructor_names).each do |constructor|
      teamtemp = Team.new(@data, driverset, constructor)
      arraytemp = driverset + [constructor]

      if (myteam & arraytemp).length >= 5
        teams.push teamtemp
      end
    end
  end

  teams = teams.sort_by {|team| team.points}.reverse!
  print_interrace_teams(teams)
end

def generate_initial_teams

  teams=[]

  driversets = generate_driverset
  constructor_names = generate_constructorset
  driversets.each do |driverset|
    (constructor_names).each do |constructor|
      teamtemp = Team.new(@data, driverset, constructor)
      teams.push teamtemp
    end
  end

  teams = teams.sort_by {|team| team.points}.reverse!
  print_teams(teams)
end

def print_teams(teams)
  puts '======================'
  puts 'NEW TEAMS FROM SCRATCH'
  puts '======================'
  teams = teams[0..50]

  teams.each do |team|
    if team.active ==false
      next
    end
    output = ""
    for driver in team.drivers
      output+= "#{driver.name}"
      if driver.name == team.turbo.name
        output+= "(T)"
      end
      output += ","
    end

    output += "   | Constructor: #{team.constructor.name}"
    output += "   | average points of this team so far: #{team.points.round(2)}"
    output += "   | cost: #{team.cost}"
    
    puts output
  end
end

def print_interrace_teams(teams)
  puts '=========================='
  puts 'TRADES THIS RACE'
  puts '=========================='
  teams.each do |team|
    if team.active == false
      next
    end
    output = ""
    for driver in team.drivers
      output+= "#{driver.name}"
      if driver.name == team.turbo.name
        output+= "(T)"
      end
      output += ","
    end

    output += "   | Constructor: #{team.constructor.name}"
    output += "   | average points of this team so far: #{team.points.round(2)}"
    output += "   | cost: #{team.cost}"

    puts output
  end
end

def generate_driverset
  numslots = 5
  names = @data.drivers.keys
  names.combination(numslots).to_a
end

def generate_constructorset
  @data.constructors.keys
end



generate_inter_change_suggestions()
generate_initial_teams()
require_relative 'driver'
require_relative 'team'
require_relative 'constructor'

def generate_inter_change_suggestions

  if !File.exist?('myteam')
    return
  end
  numdrivers = 20
  numslots = 5
  numconstructornumbers = 10
  driverpossibilities =*(1..numdrivers)
  driversets = driverpossibilities.combination(numslots).to_a

  myteam = []
  File.open('myteam').each do |line|
    myteam.push(line)
  end

  puts 'Your current team:'
  puts myteam
  [0,1,2,3,4].each do |i|
      myteam[i] = Driver.new.name_to_number(myteam[i])
  end

  myteam[5] = Constructor.new.name_to_number(myteam[5])

  teams=[]

  driversets.each do |driverset|
    (991..(991+numconstructornumbers-1)).each do |constructornumber|
      teamtemp = Team.new(driverset, constructornumber)
      arraytemp = driverset + [constructornumber]
      if (myteam & arraytemp).length >=5
      teams.push teamtemp
    end
    end
  end

  teams = teams.sort_by {|team| team.points}.reverse!
  print_interrace_teams(teams)
end

def generate_initial_teams
  numdrivers = 20
  numslots = 5
  driverpossibilities =*(1..numdrivers)
  driversets = driverpossibilities.combination(numslots).to_a

  numconstructornumbers = 10

  teams=[]

  driversets.each do |driverset|
    (991..(991+numconstructornumbers-1)).each do |constructornumber|
      teamtemp = Team.new(driverset, constructornumber)
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



generate_inter_change_suggestions()
generate_initial_teams()
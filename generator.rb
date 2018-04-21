require_relative 'driver'
require_relative 'team'
require_relative 'constructor'


def main
  numdrivers = 20
  numslots = 5
  driverpossibilities =*(1..numdrivers)
  driversets = driverpossibilities.combination(numslots).to_a

  numconstructornumbers = 10


  teams=[]

  driversets.each do |driverset|
    (1..numconstructornumbers).each do |constructornumber|
      teamtemp = Team.new(driverset, constructornumber)
      teams.push teamtemp
    end
  end

  teams = teams.sort_by {|team| team.points}.reverse!
  print_teams(teams)

end

def print_teams(teams)
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

    output += team.constructor.name

    output += "--- #{team.points}"


    puts output
  end
end



main()
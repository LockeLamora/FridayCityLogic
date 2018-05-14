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

def print_team_errors(errors)
  puts 'FAILED TO RECOGNISE THE FOLLOWING, PLEASE CHECK YOUR "myteam" FILE FOR SPELLING:'
  puts errors
end
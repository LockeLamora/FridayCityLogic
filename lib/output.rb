def print_teams(teams)
  print_header 'NEW TEAMS FROM SCRATCH:'
  print_table_header
  teams = teams[0..50]

  teams.each do |team|
    if team.active ==false
      next
    end
    drivers = ""
    for driver in team.drivers
      drivers+= "#{driver.name}"
      if driver.name == team.turbo.name
        drivers+= "(T)"
      end
      drivers += ", "
    end
    drivers = drivers[0...-2]
    printrow(drivers, team.constructor.name, team.cost, team.points.round(2))
  end
  print_table_footer
end

def print_interrace_teams(teams)
  print_header('TRADES THIS RACE:')
  print_interrace_table_header
  teams.each do |team|
    if team.active == false
      next
    end
    drivers = ""
    for driver in team.drivers
      drivers+= "#{driver.name}"
      if driver.name == team.turbo.name
        drivers+= "(T)"
      end
      drivers += ", "
    end
    drivers = drivers[0...-2]
    print_interrace_row(drivers, team.constructor.name,team.cost,team.points.round(2), team.out, team.in )
  end
  print_interrace_table_footer
end

def print_team_errors(errors)
  print_header('ERROR')
  puts 'FAILED TO RECOGNISE THE FOLLOWING, PLEASE CHECK YOUR "myteam" FILE FOR SPELLING:'
  puts errors
end

def print_current_team(myteam)
  print_header 'Your current team:'
  puts myteam
end

def print_header(text)
  puts '=========================='
  puts text
  puts '=========================='
end

def print_header(text)
  puts '=========================='
  puts text
  puts '=========================='
end

def print_table_header(type=:header)
  drivercolumn = ' '*26 + 'DRIVERS' + ' '*26
  vdivider = '|'
  constructorscolumn = ' '*5 + 'CONSTRUCTOR' + ' '*5
  averagepointsheader = ' '* 5 + 'Avg Pts' + ' '* 5
  costheader = ' COST '
  header = vdivider + drivercolumn + vdivider + constructorscolumn + vdivider\
  + averagepointsheader + vdivider + costheader + vdivider

  hdivider = '_' * header.length

  if type == :header
    puts hdivider
    puts header
    puts hdivider
  else
    puts hdivider
  end

end

def print_table_footer
  print_table_header(:footer)
end

def printrow(drivers, constructor, cost, averagepointsperrace)
  vdivider = '| '
  drivers = drivers + (' ' * (59 - drivers.length))
  constructor = constructor + (' ' * (21 - constructor.length))
  cost = cost.to_s + (' ' * (6-cost.to_s.length))
  averagepointsperrace = averagepointsperrace.to_s + (' ' * (17-averagepointsperrace.to_s.length))

  row = vdivider + drivers + vdivider + constructor + vdivider + averagepointsperrace + vdivider\
 + cost + vdivider

  puts row
end

def print_interrace_table_header(type=:header)
  drivercolumn = ' '*26 + 'DRIVERS' + ' '*26
  vdivider = '|'
  constructorscolumn = ' '*5 + 'CONSTRUCTOR' + ' '*5
  teamoutcolumn = ' '*6 + 'OUT' + ' '*6
  teamincolumn = ' '*6 + 'IN' + ' '*6
  averagepointsheader = ' '* 5 + 'Avg Pts' + ' '* 5
  costheader = ' COST '
  header = vdivider + drivercolumn + vdivider + constructorscolumn + vdivider\
  + teamoutcolumn + vdivider + teamincolumn + vdivider +\
averagepointsheader + vdivider + costheader + vdivider

  hdivider = '_' * header.length

  if type == :header
    puts hdivider
    puts header
    puts hdivider
  else
    puts hdivider
  end

end

def print_interrace_table_footer
  print_interrace_table_header(:footer)
end

def print_interrace_row(drivers, constructor, cost, averagepointsperrace, teamout, teamin)
  vdivider = '| '
  drivers = drivers + (' ' * (59 - drivers.length))
  constructor = constructor + (' ' * (21 - constructor.length))
  cost = cost.to_s + (' ' * (6-cost.to_s.length))
  teamout = teamout + (' ' * (15 - teamout.length))
  teamin = teamin + (' '* (14 - teamin.length))
  averagepointsperrace = averagepointsperrace.to_s + (' ' * (17-averagepointsperrace.to_s.length))

  row = vdivider + drivers + vdivider + constructor + vdivider + teamout +\
vdivider + teamin + vdivider+ averagepointsperrace + vdivider\
 + cost + vdivider

  puts row
end
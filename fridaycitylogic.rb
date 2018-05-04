require_relative 'lib/driver'
require_relative 'lib/team'
require_relative 'lib/constructor'
require_relative 'lib/f1data'
require_relative 'lib/output'


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

  teams = @data.generate_teams_list(myteam)
  teams = teams.sort_by {|team| team.points}.reverse!
  print_interrace_teams(teams)
end

def generate_initial_teams
  teams = @data.generate_teams_list
  teams = teams.sort_by {|team| team.points}.reverse!
  print_teams(teams)
end


generate_inter_change_suggestions()
generate_initial_teams()
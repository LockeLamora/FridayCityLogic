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

  teamerrors= @data.valid_input_check(myteam)
  if teamerrors.length > 0
    print_team_errors(teamerrors)
    exit
  end

 print_current_team(myteam)

  teams = @data.generate_teams_list(myteam)
  print_interrace_teams(teams)
end

def generate_initial_teams
  teams = @data.generate_teams_list
  print_teams(teams)
end


generate_inter_change_suggestions()
generate_initial_teams()
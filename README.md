# Friday City Logic
A fantasy formula 1 team generator for fantasy.formula1.com

running fridaycitylogic.rb will output all possible combinations in descending order of points

# Usage
```
ruby fridaycitylogic.rb | tee output
```
is the best way to save this to a text file (on a linux-like command terminal like OSX or linux systems) 

There are 3 sample myteam files, put your current lineup for each team and the remaining budget into these files and it will suggest subsitutions to your team each race

# A note on stats

We've kept the 2018 stats in to make slightly betetr educated guesses on the first race of the 2019 season, but some drivers will have moved on to better or worse teams since those stats were relevant, so use whatever common sense you wish. The script will start to build up more relevant stats as the season goes on, however.

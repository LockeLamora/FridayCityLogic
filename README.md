# Friday City Logic
A fantasy formula 1 team generator for fantasy.formula1.com

running fridaycitylogic.rb will output all possible combinations in descending order of points

# Usage
```
ruby fridaycitylogic.rb | tee output
```
is the best way to save this to a text file (on a linux-like command terminal like OSX or linux systems) 

If you include a 'myteam' file, which has a driver surname on each line followed by the constructor on the last line (example included in repo) then the script will give you its opinion on what to do as your next trade between races, while still giving a set of completely new lineups afterwards in case you feel like using your season wildcard.

# A note on prices

Sometimes the script will give a team that you can't afford, or it'll give a price that doesn't work out with 'budget remaining' section on your team's page.

I've contacted playon about this and apparently it's "not a bug" at their end; your budget cap changes per race by design and I've no idea why, nor can I see it in the rules. 

Until the logic behind this is figured out I've added a new file; mybudget; if you put a number here it will use this instead as your budget cap.

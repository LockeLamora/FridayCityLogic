# Friday City Logic
A fantasy formula 1 team generator for fantasy.formula1.com

running generator.rb will output all possible combinations in descending order of points
```
ruby generator.rb | tee output
```
is the best way to save this to a text file (on a linux-like command terminal like OSX or linux systems) 

If you include a 'myteam' file, in the format:

driver surname

driver surname

driver surname

driver surname

driver surname

constructor name (spaces allowed)

then the script will give you its opinion on what to do as your next trade between races, while still giving a set of completely new lineups afterwards in case you feel like using your season wildcard.

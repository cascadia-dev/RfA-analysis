echo "" > reports/allyears.duplicates
for yy in 2020 2019 2018 2017 2016 2015 2014 2013 2012 2011 2010 2009 2008
do
  echo "=== $yy ===" >> reports/allyears.duplicates
  cat reports/$yy.duplicates >> reports/allyears.duplicates
done

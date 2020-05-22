#!/bin/bash 
# prepare
year=$1

# report results
echo "Year rollup:" > diffs/$year/results-by-month
# table header to output
echo "{| class = \"wikitable\"" > reports/${year}.wiki
echo "|-" >> reports/${year}.wiki
echo "! Year || style=\"width: 7%;\" | January|| style=\"width: 7%;\" |February|| style=\"width: 7%;\" |March|| style=\"width: 7%;\" |April|| style=\"width: 7%;\" |May|| style=\"width: 7%;\" |June|| style=\"width: 7%;\" |July|| style=\"width: 7%;\" |August|| style=\"width: 7%;\" |September|| style=\"width: 7%;\" |October|| style=\"width: 7%;\" |November|| style=\"width: 7%;\" |December" >> reports/${year}.wiki
#start table
echo "|-" >> reports/${year}.wiki
echo "| $year" >> reports/${year}.wiki


for mm in 01 02 03 04 05 06 07 08 09 10 11 12
#for yy in 2020 2019 
do
  echo $year-$mm >> diffs/$year/results-by-month
  grep $year-$mm diffs/$year/results | wc -l >> diffs/$year/results-by-month 
  echo "| " >> reports/${year}.wiki
  grep $year-$mm diffs/$year/results | wc -l >> reports/${year}.wiki
done

# close table / finish output
echo "|}" >> reports/${year}.wiki

cat diffs/$year/results-by-month 
echo "Duplicates:"
cat diffs/$year/*$year-* | uniq -d > reports/$year.duplicates
cat reports/$year.duplicates

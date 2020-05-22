echo RFA analysis

source fetch-diff.sh 2020
source report-rfa-from-diff.sh 2020
cat reports/2020.wiki > reports/allyears.wiki

for yy in 2019 2018
do
  source fetch-diff.sh $yy
  source report-rfa-from-diff.sh $yy
  cat reports/$yy.wiki >> reports/allyears.wiki
done


echo "" > reports/allyears.duplicates
for yy in 2020 2019 2018
do
  echo "=== $yy ===" >> reports/allyears.duplicates
  cat reports/$yy.duplicates >> reports/allyears.duplicates
done
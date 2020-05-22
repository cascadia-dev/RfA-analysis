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


source report-duplicates.sh
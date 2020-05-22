echo "" > tmp/dup
for yy in 2020 2019 2018 2017 2016 2015 2014 2013 2012 2011 2010 2009
do

  for mm in 01 02 03 04 05 06 07 08 09 10 11 12
  do
    # something
    echo "$yy-$mm"
    cat diffs/$yy/*$yy-$mm* | sort | uniq -D | uniq > tmp/d1
    cat diffs/$yy/*$yy-$mm* | sort | uniq -D > tmp/d2
    comm -13 tmp/d1 tmp/d2 | wc -l
  done
done

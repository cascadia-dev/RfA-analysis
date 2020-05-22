echo FETCHING $1, SAVING $2
# this pattern will match RfA transclusions
pat="{{Wikipedia\:Requests for adminship/(?!Header)(?!bureaucratship)\K[^}]*"


# the next two lines replace the complex mediawiki tag in the first line of the fetched XML
echo "<mediawiki>" > tmp/rev1
source export.sh $1 | tail -n +2  >> tmp/rev1

# examine results for next timestamp and page contents
timestamp_last=$(cat tmp/timestamp)
xmllint --xpath '/mediawiki/page/revision/timestamp/text()' tmp/rev1 > tmp/timestamp
xmllint --xpath '/mediawiki/page/revision/id/text()' tmp/rev1 > tmp/id_next
page_id_last=$page_id
page_id=$(cat tmp/id_next)
timestamp=$(cat tmp/timestamp)
echo "DEBUG: page_id_last=$page_id_last page_id=$page_id timestamp=$timestamp"

# first grep for all RfA transclusions, then do a diff on tr. text between last revision and this one
xmllint --xpath '/mediawiki/page/revision/text/text()' tmp/rev1 | grep -oP "$pat" | sort > pages/$page_id
echo "generating diff $page_id --> $page_id_last"
comm -13 --output-delimiter="" pages/$page_id pages/$page_id_last > $2/$page_id_last-$timestamp_last

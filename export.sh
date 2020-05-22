#param 1 is timestamp
#echo "offset=$1&limit=1"

#data returned from Wikipedia servers is in XML
#further documentation is at https://en.wikipedia.org/wiki/Help:Export
path="https://en.wikipedia.org/w/index.php?title=Special:Export&dir=desc&nsindex=4&pages=Wikipedia:Requests_for_adminship&offset=$1&limit=1&action=submit"
#echo $path
curl -d "" $path
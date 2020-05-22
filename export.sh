#param 1 is timestamp
#echo "offset=$1&limit=1"
path="https://en.wikipedia.org/w/index.php?title=Special:Export&dir=desc&nsindex=4&pages=Wikipedia:Requests_for_adminship&offset=$1&limit=1&action=submit"
#echo $path
curl -d "" $path
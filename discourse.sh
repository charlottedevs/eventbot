API_KEY='poop'
UPCOMING_EVENTS='10'

curl -X POST "https://charlottedevs.com/posts" \
-H "Content-Type: multipart/form-data;" \
-F "api_key=$API_KEY" \
-F "api_username=john" \
-F "raw=testbody" \
-F "title=this is a test" \
-F "skip_validations=true" \
-F "category=$UPCOMING_EVENTS"

API_KEY='poop'

URL="https://api.meetup.com/find/upcoming_events?&sign=true&photo-host=public&topic_category=292&page=20&radius=10&order=time&key=$API_KEY"

curl "$URL" | jq '.'

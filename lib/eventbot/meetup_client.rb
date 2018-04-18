MEETUP_API_KEY = ENV['MEETUP_API_KEY'].freeze

module MeetupClient
  class << self
    def tech_events
      raise 'wtf' if $TESTING
      r = Faraday.get('https://api.meetup.com/find/upcoming_events', {
        sign: true,
        lat: 35.227,
        lon: -80.8431,
        topic_category: 292, #tech
        order: 'time',
        radius: 10,
        key: MEETUP_API_KEY
      })

      JSON.parse(r.body)['events']
    end
  end
end

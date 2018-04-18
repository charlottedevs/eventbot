require 'discourse_api'

ENDPOINT = 'https://charlottedevs.com'.freeze

module DiscourseClient
  class << self

    def event_topics
      raise 'wtf' if $TESTING
      # discourse client kinda sucks for this endpoint
      r = Faraday.get("#{ENDPOINT}/c/upcoming-events.json?order=created")
      JSON.parse(r.body).dig('topic_list', 'topics')
    end

    def publish(obj, category: 'upcoming_events')
      client.create_topic(
        category: category,
        skip_validations: true,
        auto_track: false,
        title: obj.title,
        raw: obj.body
      )
    end

    private

    def client
      raise 'wtf' if $TESTING
      return @client if @client
      @client = DiscourseApi::Client.new("https://charlottedevs.com")
      @client.api_key = "YOUR_API_KEY"
      @client.api_username = "discobot"
    end
  end
end

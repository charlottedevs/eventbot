require 'discourse_api'

DISCOURSE_ENDPOINT = 'https://charlottedevs.com'.freeze
DISCOURSE_API_KEY = ENV['DISCOURSE_API_KEY'].freeze
DISCOURSE_USERNAME = 'discobot'.freeze

module DiscourseClient
  class << self

    def event_topics
      raise 'wtf' if $TESTING
      # discourse client kinda sucks for this endpoint
      r = Faraday.get("#{DISCOURSE_ENDPOINT}/c/upcoming-events.json?order=created")
      JSON.parse(r.body).dig('topic_list', 'topics')
    end

    def publish(obj, category: 'upcoming_events')
      puts "publishing: #{obj['title']}"
      client.create_topic(
        category: 10,
        skip_validations: true,
        auto_track: false,
        title: obj['title'],
        raw: obj['body']
      )
    end

    private

    def client
      raise 'wtf' if $TESTING
      @client ||= DiscourseApi::Client.new(
        DISCOURSE_ENDPOINT,
        DISCOURSE_API_KEY,
        DISCOURSE_USERNAME
      )
    end
  end
end

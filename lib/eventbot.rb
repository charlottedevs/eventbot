require 'dotenv/load'

require 'json'
require 'time'
require_relative './eventbot/discourse_client'
require_relative './eventbot/event_bouncer'
require_relative './eventbot/meetup_client'

module EventBot
  class << self
    def publish_events
      existing_topics = DiscourseClient.event_topics

      events.each do |e|
        next unless EventBouncer.approve(existing_topics, e)
        DiscourseClient.publish(e)
      end

      puts "done"
    end

    def events
      @events ||= raw_events.to_a.map do |e|
        e.merge(
          'body' => "#{e['description']} \n\n#{e['link']}",
          'title' => "#{e['name']} (#{event_start(e)})"
        )
      end
    end

    private

    def raw_events
      MeetupClient.tech_events
    end

    def event_start(event)
      dt = Time.parse(event['local_date'] + ' ' + event['local_time'])
      dt.strftime '%m/%d %I:%M %P'
    end
  end
end



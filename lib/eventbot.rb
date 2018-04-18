require 'json'
require 'time'
require_relative './eventbot/discourse_client'

module EventBot
  class << self
    def events
      @events ||= raw_events.map do |e|
        e.merge(
          'body' => e['description'] + "\n#{e['link']}",
          'title' => "#{e['name']} (#{event_start(e)})"
        )
      end
    end

    private

    def raw_events
      raise 'not implemented'
    end

    def event_start(event)
      dt = Time.parse(event['local_date'] + ' ' + event['local_time'])
      dt.strftime '%m/%d %I:%M %P'
    end
  end
end



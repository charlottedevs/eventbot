require 'json'

module EventBot
  class << self
    def events
      @events ||= raw_events.map do |e|
        e.merge(
          body: e['description'] + "\n#{e['link']}"
        )
      end
    end

    private

    def raw_events
      raise 'not implemented'
    end
  end
end



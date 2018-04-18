require 'discourse_api'


module DiscourseClient
  class << self

    private

    def client
      client = DiscourseApi::Client.new("https://charlottedevs.com")
      client.api_key = "YOUR_API_KEY"
      client.api_username = "discobot"
    end
  end
end

require 'spec_helper'

RSpec.describe EventBot do
  subject { described_class }

  let(:raw_events) do
    json = JSON.parse File.read('spec/fixtures/meetups.json')
    json['events']
  end

  before do
    allow(subject).to receive(:raw_events).and_return raw_events
  end

  describe '#events' do
    let(:event) { subject.events.sample }

    it 'responds to events' do
      expect(subject).to respond_to :events
    end

    it 'returns an array of events' do
      expect(subject.events).to_not be_empty
    end

    %i(body).each do |attr|
      it "an event has #{attr} property" do
        expect(event).to have_key(attr)
      end
    end

    it 'has the meetup url in the body property' do
      expect(event[:body]).to include event['link']
    end
  end
end
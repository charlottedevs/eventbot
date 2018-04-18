require 'spec_helper'

RSpec.describe DiscourseClient do
  subject { described_class }

  before do
    allow(subject).to receive(:client).and_return client
  end

  let(:client) { double(:client) }
  let(:obj) { double(:obj, title: 'title', body: 'body') }

  it 'responds to event_topics' do
    expect(subject).to respond_to :event_topics
  end

  describe '#publish' do
    it 'calls on Discourse API .create_topic' do
      expect(client).to receive(:create_topic).with(
        category: 'upcoming_events',
        skip_validations: true,
        auto_track: false,
        title: obj.title,
        raw: obj.body
      )

      subject.publish(obj)
    end
  end
end

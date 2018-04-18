require 'spec_helper'

RSpec.describe MeetupClient do
  subject { described_class }

  it 'responds to #tech_events' do
    expect(subject).to respond_to :tech_events
  end
end

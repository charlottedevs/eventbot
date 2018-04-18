require 'spec_helper'

RSpec.describe DiscourseClient do
  subject { described_class }

  xit 'wrapper for discourse_gem' do
    expect(subject).to be_an_instance_of DiscourseApi::Client
  end
end

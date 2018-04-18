require 'spec_helper'

RSpec.describe EventBouncer do
  subject { described_class }

  let(:list) do
    json = JSON.parse File.read('spec/fixtures/topics.json')
    json.dig('topic_list', 'topics')
  end

  describe 'approve' do
    it 'returns false if a match title is found on list' do
      item = list.sample

      expect(subject.approve(list, item)).to be false
    end

    it 'returns true if no matching title is found on list' do
      item = { 'title' => 'bar' }

      expect(subject.approve(list, item)).to be true

    end
  end
end

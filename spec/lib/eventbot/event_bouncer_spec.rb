require 'spec_helper'

RSpec.describe EventBouncer do
  subject { described_class }

  let(:list) do
    json = JSON.parse File.read('spec/fixtures/topics.json')
    json.dig('topic_list', 'topics')
  end

  describe 'approve' do
    context 'list matching' do

      before do
        allow(subject).to receive(:minimum_rsvp_count).and_return 0
      end

      it 'returns false if a match title is found on list' do
        item = list.sample
        expect(subject.approve(list, item)).to be false
      end

      it 'returns true if no matching title is found on list' do
        item = { 'title' => 'bar' }
        expect(subject.approve(list, item)).to be true
      end
    end

    context 'minimum rsvp count' do
      let(:item) do
        { 'title' => 'bar' }
      end

      it 'returns true if >= minimum rsvp count' do
        item['yes_rsvp_count'] = subject.minimum_rsvp_count
        expect(subject.approve(list, item)).to be true

        item['yes_rsvp_count'] = subject.minimum_rsvp_count + 1
        expect(subject.approve(list, item)).to be true
      end

      it 'returns false if less than minimum rsvp count' do
        item['yes_rsvp_count'] = subject.minimum_rsvp_count - 1
        expect(subject.approve(list, item)).to be false
      end
    end
  end
end

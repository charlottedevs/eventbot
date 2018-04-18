module EventBouncer
  class << self
    def approve(list, obj)
      return unless list
      not_on_list?(list, obj) && rsvp_minimum?(obj)
    end

    def minimum_rsvp_count
      5
    end

    private

    def not_on_list?(list, obj)
      list.none? { |item| item['title'] === obj['title']}
    end

    def rsvp_minimum?(obj)
      obj['yes_rsvp_count'].to_i >= minimum_rsvp_count
    end
  end
end

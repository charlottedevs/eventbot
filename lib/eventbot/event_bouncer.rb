module EventBouncer
  class << self
    def approve(list, obj)
      return unless list
      list.none? { |item| item['title'] === obj['title']}
    end
  end
end

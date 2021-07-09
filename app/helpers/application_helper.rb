# frozen_string_literal: true

module ApplicationHelper
  def show_link(object, link: nil, content: 'Show', **options)
    link_to(content, link || object, options) if can?(:show, object)
  end
end

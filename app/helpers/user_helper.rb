# frozen_string_literal: true

module UserHelper
  def reviewer(review)
    review.reviewer ? review.reviewer.first_name : '[removed]'
  end

  def assessor(estimate)
    estimate.author ? estimate.author.first_name : '[removed]'
  end
end

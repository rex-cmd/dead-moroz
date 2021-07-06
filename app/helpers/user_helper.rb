module UserHelper
    def reviewer(review)
      review.reviewer ? review.reviewer.first_name : '[removed]'
    end
  
    def assessor(estimate)
      estimate.author ? estimate.author.first_name : '[removed]'
    end
    def tr_cache_behavior
      @translation = Rails.cache.fetch(['translate', user.cache_key_with_version], expires_in: 1.hour) do
        GoogleTranslate.translate(@user.behavior)
      end
    end
end
  
# frozen_string_literal: true

module DeviseHelper
  PLACEHOLDER_AVATAR = 'https://dead-moroz.fra1.digitaloceanspaces.com/placeholder_avatar.png'
  def avatar_url
    user_signed_in? ? current_user.avatar.url : PLACEHOLDER_AVATAR
  end
end

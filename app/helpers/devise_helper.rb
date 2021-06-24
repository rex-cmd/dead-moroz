module DeviseHelper
    PLACEHOLDER_AVATAR=[]
    def avatar_url
        user_signed_in? ? current_user.avatar.url : PLACEHOLDER_AVATAR
    end
end
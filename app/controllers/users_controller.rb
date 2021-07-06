class UsersController < ApplicationController
    load_and_authorize_resource
    helper_method :user
    include GoogleTranslate 
    def index 
        @users = @users.kid.with_not_decided_gifts if can?(:toggle_selected, Gift) && user_params[:not_decided] == 'true'
        # @users = @users.by_number_of_reviews if current_user.elf?
       
    end

    def show
        @estimate = user.estimates_on.find_by(author: current_user)
        respond_to do |format|
          format.js do
            tr_cache_behavior
          end
          format.html
        end
    end

    private 
    def user
        @user ||= User.find(user_params[:id])
    end
    def user_params
        params.permit(:id, :page, :direction, :sort, :not_decided)
      end
end
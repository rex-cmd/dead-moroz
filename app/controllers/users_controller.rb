class UsersController < ApplicationController
    load_and_authorize_resource
    helper_method :user
   
    def index 
        @users = @users.kid.with_not_decided_gifts if can?(:toggle_selected, Gift) && user_params[:not_decided] == 'true'
        @users = @users.by_number_of_reviews if current_user.elf?
        # @users = @users.order("#{sort_column} #{sort_direction}").page(user_params[:page])
    end

    def show
        @estimate = user.estimates_on.find_by(author: current_user)
    end

    private 
    def user
        @user ||= User.find(user_params[:id])
    end
end
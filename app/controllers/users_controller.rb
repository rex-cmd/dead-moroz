class UsersController < ApplicationController
    load_and_authorize_resource
    helper_method :user
   
    def index 
        
    end

    def show
    end

    private 
    def user
        @user ||= User.find(user_params[:id])
    end
end
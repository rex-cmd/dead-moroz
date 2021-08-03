# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_authorization_check
  def index
    render json: {message: 'Welcome'}
  end
end

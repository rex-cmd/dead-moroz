# frozen_string_literal: true

class EstimatesController < ApplicationController
  load_and_authorize_resource through: :user, through_association: :estimates_on
  helper_method :user

  def create
    @estimate.author = current_user
    @estimate.save
    redirect_to user, alert: @estimate.errors.full_messages[0]
  end

  def destroy
    @estimate.destroy
    redirect_to user_path(user), notice: 'Estimation was successfully removed.'
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def estimate_params
    params.require(:estimate).permit(:id, :value, :comment)
  end
end

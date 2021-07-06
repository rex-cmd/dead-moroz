# frozen_string_literal: true

class ReviewsController < ApplicationController
  load_and_authorize_resource through: :user, through_association: :reviews_on

  def create
    @review.reviewee = user
    @review.save
    redirect_to user
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user
    flash[:success] = 'Review was successfully removed.'
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:id, :body)
  end
end

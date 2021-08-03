# frozen_string_literal: true

class ImagesController < ApplicationController
  load_and_authorize_resource through: :gift
  helper_method :gift

  def create
    if image_params[:image].present?
      gift.images.create(image: {url: image_params[:image] } )
      # gift.images.create(image: image_params[:image][:image])
      render json: gift.images
    else
      render json: image_params
    end
  end

  def destroy
    @image.destroy
    redirect_to user_gift_url(id: gift)
  end

  private

  def gift
    @gift ||= Gift.find(params[:gift_id])
  end

  def image_params
    # params.permit(:id, image: [:image])
    params.permit(:id, :gift_id, :user_id, image: :url)
  end
end

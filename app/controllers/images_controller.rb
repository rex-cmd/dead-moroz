# frozen_string_literal: true

class ImagesController < ApplicationController
  load_and_authorize_resource through: :gift
  helper_method :gift

  def create
    if image_params[:image].present?
      gift.images.create(image: image_params[:image][:image])
      redirect_to user_gift_path(id: gift)
      flash[:success] = 'Image has been added.'
    else
      redirect_to user_gift_url(id: gift)
      flash[:danger] = 'Choose an image first.'
    end
  end

  def destroy
    @image.destroy
    redirect_to user_gift_url(id: gift)
    flash[:success] = 'Image has been removed.'
  end

  private

  def gift
    @gift ||= Gift.find(params[:gift_id])
  end

  def image_params
    params.permit(:id, image: [:image])
  end
end

# frozen_string_literal: true
class GiftsController < ApplicationController
  load_resource :user
  load_and_authorize_resource through: :user
  helper_method :user, :gift
  skip_load_resource only: :create
  def index
    authorize! :show, user.gifts.build
    @gifts = @gifts.order('created_at DESC')
    render json: @gifts
  end

  def edit; end

  def show
    @images = gift.images.all
    @image = gift.images.build
    render json: @images
  end

  def new
    @gift.images.build
  end

  def create
    @gift = user.gifts.build(title: gift_params[:title], description: gift_params[:description], added_by: current_user)
    if @gift.save
      create_images if gift_params[:images_attributes].present?
      # gift_params[:images_attributes][:image].each do |image|
      #   @gift.images.create(image: image)
      #   render json: {response:"If you see this, you have an image!" }
      # end
# render json: gift_params[:images_attributes][:image]
      # redirect_to user_gifts_path
       # flash[:success] = 'Gift was successfully created.'
    #  render json: @gift
    else
      # render :new
      # render json: {response:"If you see this, you don't have an image!" }
    end
  # render json: @gift
  end

  def update
    if gift.update(gift_params)
      redirect_to user_gift_path
      flash[:success] = 'Gift was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    gift.destroy
    redirect_to user_gifts_url
    flash[:success] = 'Gift was successfully deleted.'
  end

  def toggle_selected
    @gift.toggle(:selected).save
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def gift
    @gift ||= Gift.find(params[:id])
  end

  def create_images
    Image.transaction do
      # gift_params[:images_attributes][:image].each do |image|
      #   @gift.images.create(image: image)
      # end
      @gift.images.create(image: gift_params[:images_attributes][:image] )
      render json: gift_params[:images_attributes][:image] 
    end
   
  end

  def gift_params
    # params.require(:gift).permit(:title, :description, images_attributes: [image: []])
     params.require(:gift).permit(:title, :description, images_attributes: {image: :url})
  end
end

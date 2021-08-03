# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  # before_action :verify_invite
  # helper_method :invite
  # respond_to :json
  def create
    build_resource(sign_up_params)
    resource.save
    sign_up(resource_name, resource) if resource.persisted?

    render_jsonapi_response(resource)
  end
  # def create
  #   # super do |resource|
  #   #   @invite = Invitation.find_by(email: params[:user][:email]) # can't find by token becouse params are updated
  #   #   # @user = User.find_by(user_id: params[:user][:user_id])
  #   #   if @invite.present?
  #   #     resource.update(role: 'elf')
  #   #     @invite.accept!
  #   #   end
  #   #   # payload = {resource_id: resource.id}
  #   #   # token=encode_token(payload)
  #   #   # render json: {resource: resource, jwt: token}
  #   # end
  # end

  # private

  # def respond_with(resource, _opts = {})
  #   register_success && return if resource.persisted?
  #   register_failed
  # end

  # def register_success
  #   render json: { message: 'Signed up sucessfully.' }
  # end

  # def register_failed
  #   render json: { message: "Something went wrong." }
  # end
  # def verify_invite
  #   token = params[:token]
  #   redirect_to(new_user_registration_path, alert: 'Invalid token') unless token.blank? || invite.try(:pending?)
  # end

  # def invite
  #   @invite ||= Invitation.find_by(token: params[:token]) # only token is passed in params
  # end
end

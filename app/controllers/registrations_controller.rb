class RegistrationsController < Devise::RegistrationsController
  before_action :verify_invite, only: :new
  helper_method :invite

  def create
    super do |resource|
      @invite = Invitation.find_by(email: params[:user][:email])# can't find by token becouse params are updated
      byebug
      if @invite.present?
        byebug
        resource.update(role: 'elf')
        byebug
        invite.accept!
      end
    end
  end

  private

  def verify_invite
    token = params[:token]
    redirect_to(new_user_registration_path, alert: 'Invalid token') unless token.blank? || invite.try(:pending?)
  end

  def invite
    @invite ||= Invitation.find_by(token: params[:token])#only token is passed in params
  end
end
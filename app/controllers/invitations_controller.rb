class InvitationsController < ApplicationController
  SORTABLE_COLUMNS = %w[status email].freeze
  include Sortable

  load_and_authorize_resource
  # skip_authorization_check
  helper_method :sort_column, :sort_direction, :sortable_columns

  def index
    @invitations = @invitations.order("#{sort_column} #{sort_direction}").page(params[:page])
    @invitation = Invitation.new
    render json: @invitations
  end

  def create
    if @invitation.save
      NotificationMailer.elf_invite_email(@invitation.email,
                                          new_user_registration_url(token: @invitation.token)).deliver_now
      InvitationWorker.perform_at(1.day.from_now, @invitation.id, current_user.email)
      notice = 'Invite was successfully sent'
    end
    redirect_to invitations_path, notice: notice, alert: @invitation.errors.full_messages_for(:email)[0]
  end

  def destroy
    @invitation.destroy
    redirect_to invitations_path, notice: 'Invite was successfully destroyed'
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end

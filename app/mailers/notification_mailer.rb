# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def elf_invite_email(email, invite_link)
    @invite_link = invite_link
    mail to: email, subject: 'Elf registration invite'
  end

  def invite_expiration_email(email, invitee_email)
    @invitee_email = invitee_email
    mail to: email, subject: 'Invite has expired'
  end
end

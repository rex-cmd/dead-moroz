# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def kek_email
    mail to: 'rororor@sharklasers.com', subject: 'Subj'
  end
end

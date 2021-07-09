class CongratulationMailer < ApplicationMailer
  def congratulation_email(user)
    @name = user.first_name
    mail to: user.email, subject: 'Letter of gratitude'
  end
end
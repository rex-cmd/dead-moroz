require 'sidekiq-scheduler'

class WorkReminderWorker < ApplicationWorker
  def perform
    User.elf.each do |user|
      NotificationMailer.work_reminder_email(user.email).deliver_now
    end
  end
end
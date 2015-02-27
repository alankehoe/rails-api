# This class is used to send mails or notifications from the system
# it includes modules that contain definitions for actually sending mails
# the class its self contains some helper definitions
#
# All notification views can be found at /app/views/notification/
class Notification < ActionMailer::Base
  include Emails::UserMails

  default from: Settings['mandrill']['mail_from']
  default reply_to: Settings['mandrill']['reply_to']

  private

  # Look up a User by their ID and return the instance
  #
  # @param recipient_id[uuid] the recipient id
  # @return [User] the recipient instance.
  def recipient(recipient_id)
    User.find recipient_id
  end

  # Formats arguments into a String suitable for use as an email subject
  #
  # @param *args[Array] Extra Strings to be inserted into the subject
  # @return String the generated subject line
  def subject(*args)
    subject = "#{Settings['application']['name']} | "
    subject << args.join(' ') if args.present?
    subject
  end
end
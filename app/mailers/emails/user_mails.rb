module Emails
  # This module is used to send emails to users
  # These mails may be triggered by various events or actions.
  module UserMails
    # used to send a new user email. this method takes a uuid to find the
    # user instead of a user instance this is to ensure it is performant
    # when using redis, as object instances should not be serialized in redis
    #
    # @param user_id[uuid] the users id
    # @return Mail the mail to be rendered
    def new_user_email(user_id)
      @user = recipient user_id
      mail to: @user.email, subject: subject('Welcome', @user.name)
    end
  end
end
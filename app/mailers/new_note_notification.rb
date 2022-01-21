class NewNoteNotification < ApplicationMailer
  def send_email(user)
    # @user = user
    # mail(to: @user.email, subject: "New Notes for players!")

    # testing email
    mail(to: user, subject: "New Notes for players!")
  end
end

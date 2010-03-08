class Mailer < ActionMailer::Base
  

  def invitation(invitation, signup_url)
    subject    "You've been invited to sign up for Alacarte"
    recipients invitation.recipient_email
    from       'support@alacarteapp.com'
    body       :invitation => invitation, :signup_url => signup_url
    invitation.update_attribute(:sent_at, Time.now)
  end

end

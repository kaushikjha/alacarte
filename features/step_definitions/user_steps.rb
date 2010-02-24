Given /^I am signed up with "(.*)\/(.*)"$/ do |email, password|
  invitation = Invitation.create!(:recipient_email => email)
  user = User.create!(:invitation_id => invitation.id, :email => email, :password => password, :password_confirmation => password)
end

Given /^I am signed up with and signed in as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am signed up with "#{email}/#{password}"}
  When %{I sign in as "#{email}/#{password}"}
end

Given /^no user exists with an email of "(.*)"$/ do |email|
  assert_nil User.find_by_email(email)
end

module UserHelpers
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
end
World(UserHelpers)

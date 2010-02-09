When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Login"}
end

Then /^I should be signed in$/ do
  assert controller.signed_in?
end

Then /^I sign out$/ do
  visit '/logout'
end

Then /^I should be signed out$/ do
  assert ! controller.signed_in?
end

When /^session is cleared$/ do
  request.reset_session
  controller.instance_variable_set(:@_current_user, nil)
end

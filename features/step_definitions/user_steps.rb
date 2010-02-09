Given /^I am signed up with "(.*)\/(.*)"$/ do |email, password|
  user = User.create!(:email => email, :password => password, :password_confirmation => password)
end

Given /^no user exists with an email of "(.*)"$/ do |email|
  assert_nil User.find_by_email(email)
end

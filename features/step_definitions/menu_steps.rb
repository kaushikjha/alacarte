Given /^I have no menus$/ do
  @user = current_user
  @user.menus.destroy
end

Given /^I have a menu called "([^\"]*)"$/ do |name|
  @user = current_user
  @menu = @user.menus.create(:name => name)
end

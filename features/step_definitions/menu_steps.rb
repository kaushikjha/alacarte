Given /^I have no menus$/ do
  @user = current_user
  @user.menus.destroy
end

Given /^I have a menu called "([^\"]*)"$/ do |name|
  menu = Menu.create(:user_id => current_user.id, :name => name)
end

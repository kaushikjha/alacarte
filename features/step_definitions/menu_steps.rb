Given /^I have no menus$/ do
  @user = current_user
  @user.menus.destroy
end
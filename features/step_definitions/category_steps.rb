Given /^that menu has a category called "([^\"]*)"$/ do |name|
  menu = Menu.last
  category = menu.categories.create(:user_id => current_user.id, :name => name)
end
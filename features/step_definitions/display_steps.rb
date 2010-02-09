Then /^I should see error messages$/ do
  assert_match /error(s)? prohibited/m, response.body
end

When /^I return next time$/ do
  When %{session is cleared}
  And %{I go to the homepage}
end
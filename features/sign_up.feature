Feature: Sign Up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

  Scenario: User signs up with invalid data
    When I go to the sign up page
    And I fill in "Email" with "invalidemail"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with ""
    And I press "Register"
    Then I should see error messages
  
  Scenario: User signs up with valid data
    When I go to the sign up page
    And I fill in "user_email" with "email@person.com"
    And I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I press "Register"
    Then I should see "Account registered!"
  
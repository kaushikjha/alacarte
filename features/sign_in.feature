Feature: Sign in
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign in

  Scenario: User is not signed up
    Given no user exists with an email of "email@person.com"
    When I go to the sign in page
    And I sign in as "email@person.com/password"
    Then I should see error messages
    And I should be signed out
  
  Scenario: User enters wrong password
    Given I am signed up with "email@person.com/password"
    When I go to the sign in page
    And I sign in as "email@person.com/wrongpassword"
    Then I should see error messages
    And I should be signed out
  
  Scenario: User signs in successfully
    Given I am signed up with "email@person.com/password"
    When I go to the sign in page
    And I sign in as "email@person.com/password"
    Then I should see "Login successful"
    And I should be signed in
    When I return next time
    Then I should be signed in
  
  
  

Feature: Sign out
  In order to protect my account from unauthorized access
  As a signed in user
  I want to be able to sign out

  Scenario: User signs out
    Given I am signed up with "email@person.com/password"
    When I sign in as "email@person.com/password"
    Then I should be signed in
    And I sign out
    Then I should see "Logout successful"
    And I should be signed out
    When I return next time
    Then I should be signed out
  
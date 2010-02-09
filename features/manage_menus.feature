Feature: Manage Menus
  In order to organize the items available for sale
  As an owner
  I want to be able to manage menus

  Scenario: Add First Menu
    Given I am signed up with and signed in as "email@person.com/password"
    And I have no menus
    When I am on the homepage
    Then I should see "Start by adding a menu"
    When I follow "Add Menu"
    And I fill in "Name" with "New Menu"
    And I press "Submit"
    Then I should see "Menu: New Menu"
    And I should see "Now, let's add a category"
  
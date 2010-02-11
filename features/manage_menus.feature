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
    And I press "Create"
    Then I should see "Menu: New Menu"
    And I should see "Now, let's add a category"
  
  Scenario: Add Second Menu
    Given I am signed up with and signed in as "email@person.com/password"
    And I have a menu called "First Menu"
    When I am on the homepage
    Then I should not see "Start by adding a menu"
    And I should see "First Menu"
    When I follow "Add Menu"
    And I fill in "Name" with "New Menu"
    And I press "Create"
    Then I should see "Menu: New Menu"
    And I should see "Now, let's add a category"
  
  Scenario: Existing Menu Name
    Given I am signed up with and signed in as "email@person.com/password"
    And I have a menu called "First Menu"
    When I am on the homepage
    Then I should not see "Start by adding a menu"
    And I should see "First Menu"
    When I follow "Add Menu"
    And I fill in "Name" with "First Menu"
    And I press "Create"
    Then I should see error messages  
  
  Scenario: Existing Menu Name, But Different User
    Given I am signed up with and signed in as "email@person.com/password"
    And I have a menu called "First Menu"
    When I sign out
    Given I am signed up with and signed in as "email2@person.com/password"
    When I am on the homepage
    And I follow "Add Menu"
    And I fill in "Name" with "First Menu"
    And I press "Create"
    Then I should see "Menu: First Menu"
    
Feature: Manage Categories
  In order to organize the items within a menu
  As an owner
  I want to be able to manage categories

  Scenario: Add Category
    Given I am signed up with and signed in as "email@person.com/password"
    And I have a menu called "First Menu"
    When I am on the homepage
    And I fill in "category_name" with "Category 1"
    And I press "add_category"
    Then I should see "Menu: First Menu"
    And I should see "Category 1"
  
Feature: Manage Items
  In order to detail what I offer
  As an owner
  I want to be able to manage items

  Scenario: Add Item to Category
    Given I am signed up with and signed in as "email@person.com/password"
    And I have a menu called "First Menu"
    And that menu has a category called "Appetizers"
    When I am on the homepage
    And I follow "First Menu"
    And I follow "add item to Appetizers"
    And I fill in "Name" with "Chicken Fingers"
    And I fill in "Description" with "A lovely order of chicken fingers"
    And I fill in "item_prices_attributes_0_description" with "Normal Order"
    And I fill in "Price" with "6.95"
    And I press "Add"
    Then I should see "Appetizers"
    And I should see "Chicken Fingers"
    And I should see "Normal Order: $6.95"
  
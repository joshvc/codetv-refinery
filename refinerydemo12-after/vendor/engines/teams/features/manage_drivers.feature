@drivers
Feature: Drivers
  In order to have drivers on my website
  As an administrator
  I want to manage drivers

  Background:
    Given I am a logged in refinery user
    And I have no drivers

  @drivers-list @list
  Scenario: Drivers List
   Given I have drivers titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of drivers
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @drivers-valid @valid
  Scenario: Create Valid Driver
    When I go to the list of drivers
    And I follow "Add New Driver"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 driver

  @drivers-invalid @invalid
  Scenario: Create Invalid Driver (without name)
    When I go to the list of drivers
    And I follow "Add New Driver"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 drivers

  @drivers-edit @edit
  Scenario: Edit Existing Driver
    Given I have drivers titled "A name"
    When I go to the list of drivers
    And I follow "Edit this driver" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of drivers
    And I should not see "A name"

  @drivers-duplicate @duplicate
  Scenario: Create Duplicate Driver
    Given I only have drivers titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of drivers
    And I follow "Add New Driver"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 drivers

  @drivers-delete @delete
  Scenario: Delete Driver
    Given I only have drivers titled UniqueTitleOne
    When I go to the list of drivers
    And I follow "Remove this driver forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 drivers
 
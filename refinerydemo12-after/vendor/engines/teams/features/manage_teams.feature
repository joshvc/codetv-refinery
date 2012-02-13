@teams
Feature: Teams
  In order to have teams on my website
  As an administrator
  I want to manage teams

  Background:
    Given I am a logged in refinery user
    And I have no teams

  @teams-list @list
  Scenario: Teams List
   Given I have teams titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of teams
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @teams-valid @valid
  Scenario: Create Valid Team
    When I go to the list of teams
    And I follow "Add New Team"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 team

  @teams-invalid @invalid
  Scenario: Create Invalid Team (without name)
    When I go to the list of teams
    And I follow "Add New Team"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 teams

  @teams-edit @edit
  Scenario: Edit Existing Team
    Given I have teams titled "A name"
    When I go to the list of teams
    And I follow "Edit this team" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of teams
    And I should not see "A name"

  @teams-duplicate @duplicate
  Scenario: Create Duplicate Team
    Given I only have teams titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of teams
    And I follow "Add New Team"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 teams

  @teams-delete @delete
  Scenario: Delete Team
    Given I only have teams titled UniqueTitleOne
    When I go to the list of teams
    And I follow "Remove this team forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 teams
 
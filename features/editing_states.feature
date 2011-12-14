Feature: Editing states
  In order to update state information 
  As an admin
  I want to be able to do that through an interface

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as them
    Given there is a state called "No Name"
    When I follow "Admin"
    And I follow "States"
    And I follow "No Name"
    And I follow "Edit State"

  Scenario: Updating a state
    And I fill in "Name" with "Review"
    And I press "Update State"
    Then I should see "State has been updated."

  Scenario: Updating a state with invalid attributes fails
    And I fill in "Name" with ""
    When I press "Update State"
    Then I should see "State has not been updated."
    And I should see "Name can't be blank"


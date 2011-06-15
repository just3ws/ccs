Feature: Administration console
  So That I can manage my sessions, users, etc.
  I want to have an interface to control my event

  Scenario: Administrators must log in to access the administration console
    Given I am not authenticated
    And I am on the home page
    When I follow "admin"
    Then I should see the error message:
      | You must be logged in to access the administration console. |

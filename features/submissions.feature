Feature: Speaker submissions

  Background:
    Given I am not authenticated

  Scenario: I want to post my talk
    Given I am on the home page
    When I fill in the new submission form with:
      | submission_title    | my title                 |
      | submission_abstract | the abstract description |
      | user_email          | mdh@just3ws.com          |
      | user_first_name     | michael                  |
      | user_last_name      | hall                     |
      | user_home_page      | http://just3ws.com       |
      | user_biography      | some guy, doing stuff    |
    And I select "intermediate" from "submission_level"
    And I press "submit"
    Then I should see "Thank you for submitting your proposal. If this is your first submission you should receive a confirmation email." within the message box
    And I should see "my title"
    And I should see "the abstract description"
    And I should see "intermediate"
    And I should see "logged in as..." within the authentication box
    And I should see "mdh@just3ws.com" within the authentication box


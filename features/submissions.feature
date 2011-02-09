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
    And I press "submit"
    Then I should see "Thank you for submitting your proposal. If this is your first submission you should receive a confirmation email." within the message box
    And I should see "my title"
    And I should see "the abstract description"
    And I should see "logged in as..." within the authentication box
    And I should see "mdh@just3ws.com" within the authentication box

#Scenario: I want to see my talks
#Given the following user:
#| email    | mdh@just3ws.com |
#| password | secret          |
#| role     | speaker         |
#And the following submissions exist
#| title | abstract  | email       | first_name | last_name | home_page    | biography   |
#| abc   | 1abstract | a@gmail.com | aspeaker   | talk      | http://a.com | a biography |
#| def   | 2abstract | b@gmail.com | bspeaker   | blah      | http://b.com | b biography |
#And user exists with email: "a@gmail.com", password: "secret", role: "speaker"
#And I login using the aside authentication:
#| id       | value           |
#| email    | mdh@just3ws.com |
#| password | secret          |
#And I am on the home page
#When I go to path "/submissions"
#Then I should see "abc"
#And I should not see "def"
#And show me the page

  Scenario: Login via the sidebar
    Given user has registered with "mdh@just3ws.com", "secret"
    And I am on the home page
    When I login through the sidebar:
      | id       | value           |
      | email    | mdh@just3ws.com |
      | password | secret          |
    Then I should see "logged in as..." within the authentication box
    And I should see "mdh@just3ws.com" within the authentication box

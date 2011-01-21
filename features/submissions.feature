Feature: Speaker submissions

  Scenario: I want to post my talk
    Given I am on the home page
    When I fill in the new submission form with: 
       | title      | my title                 | 
       | abstract   | the abstract description | 
       | email      | mdh@just3ws.com          | 
       | first name | michael                  | 
       | last name  | hall                     | 
       | home_page  | http://just3ws.com       | 
       | biography  | some guy, doing stuff    | 
    Then I should see "your session has been submitted" within the notice flash
    And I should see "my title"
    And I should see "the abstract description"
    And I should see "mdh@just3ws.com"
    And I should see "michael hall"
    And I should see "http://just3ws.com"
    And I should see "some guy, doing stuff"

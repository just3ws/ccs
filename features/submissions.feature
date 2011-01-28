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
    And I press "submit"
    Then I should see "Submission was successfully created." within the message box 
    And I should see "my title"
    And I should see "the abstract description"
    And I should see "mdh@just3ws.com"
    And I should see "hall"
    And I should see "michael"
    And I should see "http://just3ws.com"
    And I should see "some guy, doing stuff"
    And I should see "logged in as mdh@just3ws.com" within the authentication box 

  Scenario: I want to see my talks
    Given I am on the home page
    And I have submitted two talks

Feature: Speaker submissions

  Background:
    Given I am not authenticated

  #Scenario: I want to post my talk
    #Given I am on the home page
    #When I fill in the new submission form with:
       #| title      | my title                 |
       #| abstract   | the abstract description |
       #| email      | mdh@just3ws.com          |
       #| first name | michael                  |
       #| last name  | hall                     |
       #| home_page  | http://just3ws.com       |
       #| biography  | some guy, doing stuff    |
    #And I press "submit"
    #Then I should see "Submission was successfully created." within the message box 
    #And I should see "my title"
    #And I should see "the abstract description"
    #And I should see "mdh@just3ws.com"
    #And I should see "hall"
    #And I should see "michael"
    #And I should see "http://just3ws.com"
    #And I should see "some guy, doing stuff"
    #And I should see "logged in as mdh@just3ws.com" within the authentication box 

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
    Then I should see "logged in as mdh@just3ws.com" within the authentication box 
  

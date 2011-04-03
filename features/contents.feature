Feature: Content

  Background:
    Given there is default content
    And I am not authenticated

  Scenario: A visitor enters a non-existent page
    When I go to '/unicorns-and-cupcakes'
    Then I should see "Sorry, couldn't find the page 'unicorns-and-cupcakes'." 

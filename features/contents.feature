Feature: Content

  Scenario: A visitor enters a non-existent page
    When I navigate to '/unicorns-and-cupcakes'
    Then I should see "Sorry, couldn't find the page 'unicorns-and-cupcakes'." 

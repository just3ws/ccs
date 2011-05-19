# Feature: Authentication

#   Background:
#     Given there is default content
#     And I am not authenticated

#   Scenario: Login via the sidebar
#     Given I have registered with "mdh@just3ws.com", "secret"
#     And I am on the home page
#     When I login through the sidebar:
#       | id       | value           |
#       | email    | mdh@just3ws.com |
#       | password | secret          |
#     Then I should see "logged in as..." within the authentication box
#     And I should see "mdh@just3ws.com" within the authentication box

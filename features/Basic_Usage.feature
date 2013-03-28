Feature: Basic usage of the Salesforce UI
  In order to demonstrate Cucumber testing
  Jenkins should run through the UI

  Scenario: User creates a new Lead
    Given a new Lead
    When I enter the Last Name "Vukovitch"
     And I enter the Company "Bluewolf"
     And I click Save
    Then I should see a new Lead
     And I should see "Vukovitch"

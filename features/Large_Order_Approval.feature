Feature: Large value invoices must be approved
  In order to avoid making unmaintainable commitments
  Admins should be able to
  Approve large value invoices before they are committed

  Scenario: User orders items totalling more than 200
    Given we have 8 cars in stock
      And the price of cars is 100
      And I am logged in as a regular user
     When I order 3 cars
      And I submit for approval
     Then I should see an edit lock
      And I should see a pending approval
    Given I am logged in as an admin
     When I click the items to approve tab
      And I click on the Approve/Reject link
      And I click the approve button
     Then I should see an edit lock
      And I should see an approved approval 

  Scenario: User orders items totalling less than 200
    Given we have 8 cars in stock
      And the price of cars is 1
      And I am logged in as a regular user
     When I order 3 cars
      And I submit for approval
     Then I should see an unable to submit for approval error

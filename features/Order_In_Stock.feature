Feature: Order quantity checked against inventory
  In order to successfully ship all orders
  Users should not be able to
  Order more units of a product than are in stock

  Scenario: User orders more items than are in stock
    Given we have 8 cars in stock
    When I order 10 cars
    Then I should see a not in stock error

  Scenario: User orders less items than are in stock
    Given we have 8 cars in stock
    When I order 6 cars
    Then I should not see an error

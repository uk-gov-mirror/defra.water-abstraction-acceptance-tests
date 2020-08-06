@use-internal-test-data @wip
Feature: Create and View bill runs
  As a Billing and Data user
  I want to be able to trigger and view bill runs for my region so that
  I can ensure customers receive accurate bills as soon as possible after their licence starts or changes.
  Note: This feature will not be releasing to production for the moment.

  Scenario Outline: Assert error messages when creating a bill run
    Given I logged in as <user> user
    And I navigate to the "Manage" section
    When I trigger a bill run
    Then I should be on the page "Which kind of bill run do you want to create?"
    Examples:
      | user             | region     |
      | billing_and_data | Anglian    |




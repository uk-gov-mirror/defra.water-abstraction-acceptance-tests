@use-internal-test-data @wip
Feature: Create and View bill runs with assertion of validation messages
  As a Billing and Data user
  I want to be able to trigger and view bill runs for my region so that
  I can ensure customers receive accurate bills as soon as possible after their licence starts or changes.
  Note: This feature will not be releasing to production for the moment.

  Scenario Outline: Assert error messages when creating a bill run
    Given I logged in as <user> user
    And I navigate to the "Manage" section
    When I trigger a bill run
    Then I should be on the page "Which kind of bill run do you want to create?"
    And I click on Continue button
    Then I should see the error message "Which kind of bill run do you want to create?"
    When I select a "Two-part tariff" bill run
    And I click on Continue button
    Then I should see the error message "Select a season"
    When I select two part tariff season "winter"
    And I click on Continue button
    Then I should be on the page "Select the region"
    And I click on Continue button
    Then I should see the error message "Select the region"
    And I select a "Wales" region
    Then I click on Review link of a bill
    And I click change on Review returns data issues
    And I click on Continue button
    Then I should see the error message "Select the billable quantity"
    And I select the "Custom" billable quantity for this bill run
    And I click on Continue button
    #Then I should see the error message "Enter the billable quantity"
    When I enter the billable quantity as "100"
    And I click on Continue button
    Then I should see the error message "The quantity must be the same as or less than the authorised amount"
    Examples:
      | user             | region     |
      | billing_and_data | Anglian    |




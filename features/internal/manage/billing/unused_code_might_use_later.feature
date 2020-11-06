@use-internal-test-data @billing
Feature: Create and View bill runs
  As a Billing and Data user
  I want to be able to trigger and view bill runs for my region so that
  I can ensure customers receive accurate bills as soon as possible after their licence starts or changes.
  Note: This feature will not be releasing to production for the moment.

  Scenario Outline: [WATER-2386] Create a supplementary bill run
    Given I logged in as <user> user
    And I navigate to the "Manage" section
    When I trigger a "Supplementary" bill run for <region> region
    Then I can see the "bill run started"
    Examples:
      | user             | region     |
      | billing_and_data | Test Region|
      | super            | South West |

  Scenario Outline: [WATER-2386] View past and open bill runs
    Given I logged in as <user> user
    And I navigate to the "Manage" section
    When I select the past and open bill runs option
    Then I can see the "bill runs"
    Examples:
      | user             |
      | billing_and_data |
      | super            |

  Scenario Outline: [WATER-2386] Users without billing and data permission can't see the billing section
    Given I logged in as <user> user
    When I navigate to the "Manage" section
    Then I can't see the billing section
    Examples:
      | user |
      | wirs |
      | nps  |
      | psc  |


  Scenario Outline: remove a supplementary bill run and send bill run
    Given I logged in as <user> user
    And I navigate to the "Manage" section
    When I trigger a "Supplementary" bill run for <region> region
    Then I click on view link of a bill
    And I click on Remove from bill run button
    Then I can see the "remove this bill"
    And I click on Remove bill button
    And I click on Confirm bill run button
    Then I can see the "send this bill run"
    And I click on Send bill run button
    Then I can see the "Supplementary bill run"

    Examples:
      | user             | region     |
      | billing_and_data | Test Region|


  Scenario Outline: Annual bill run and send bill run
    Given I logged in as <user> user
    And I navigate to the "Manage" section
    When I trigger a "Annual" bill run for <region> region
    And I click on Other abstractors tab
    Then I click on view link of an Annual bill
    And I click on back link
    And I click on Confirm bill run button
    Then I can see the "send this bill run"
    And I click on Send bill run button
    Then I can see the "Annual bill run"

    Examples:
      | user             | region     |
      | billing_and_data | Test Region|


#
#  @use-internal-test-data
#  Scenario Outline: Review Two-part tariff bill run
#    Given I logged in as <user> user
#    And I navigate to the "Manage" section
#    When I trigger a "Two-part tariff" bill run for <region> region
#    Then I can see the "Review licences"
#    Then I click on Review link of a bill
#    And I click change on Review returns data issues
#    And I select the "authorised" billable quantity for this bill run
#    Then I click on Continue button
#    And I click on Continue button
#    Then I can see the "Review licences"
#    Examples:
#      | user             | region     |
#      | billing_and_data | Wales      |
#
#
#  @use-internal-test-data
#  Scenario Outline: Review Two-part tariff bill run with custom billable quantity
#    Given I logged in as <user> user
#    And I navigate to the "Manage" section
#    When I trigger a "Two-part tariff" bill run for <region> region
#    Then I can see the "Review licences"
#    Then I click on Review link of a bill
#    And I click change on Review returns data issues
#    And I select the "custom" billable quantity for this bill run
#    Then I click on Continue button
#    And I click on Continue button
#    Then I can see the "Review licences"
#    Examples:
#      | user             | region     |
#      | billing_and_data | Wales      |

#  @use-internal-test-data
#  Scenario Outline: Remove Two-part tariff bill runs
#    Given I logged in as <user> user
#    And I navigate to the "Manage" section
#    When I trigger a "Two-part tariff" bill run for <region> region
#    Then I can see the "Review licences"
#    And I remove 92 bill runs
#    Then I can see the "Review licences"
#    Then I click on Review link of a bill
#    And I click change on Review returns data issues
#    And I select the "authorised" billable quantity for this bill run
#    Then I click on Continue button
#    And I click on Continue button
#    Then I can see the "Review licences"
#    Then I click on Review link of a bill
#    And I click change on Review returns data issues
#    And I select the "custom" billable quantity for this bill run
#    Then I click on Continue button
#    And I click on Continue button
#    Then I can see the "Review licences"
#    And I click on Continue1 button
#    Then I click on Confirm button
#    And I click on Confirm bill run button
#    Then I can see the "send this bill run"
#    And I click on Send bill run button
#    Then I can see the "Two-part tariff bill run"
#    And I navigate to the "Manage" section
#    Then I select the past and open bill runs option
#    Then I can see the "bill runs"

#
#    Examples:
#      | user             | region     |
#      | billing_and_data | Wales      |

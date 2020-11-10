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



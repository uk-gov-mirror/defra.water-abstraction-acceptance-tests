@readonly @bs
Feature: [WATER - <JIRA no.>] Manage password
  As a viewer of water abstraction licences
  I want to update my password
  So that I can sign in securely

  Background: Go to Change Password screen
    Given I sign into my account as "water_user1"
    And I select Change Password
    When I enter my correct password
    Then I am on the Change Password page

  Scenario: [WATER - <JIRA no.> - AC1] Enter short password
    When I enter a password which is too short
    Then I see an error telling me the password is invalid

  Scenario: [WATER - <JIRA no.> - AC2] Enter lowercase password
    When I enter a password with no uppercase letters
    Then I see an error telling me the password is invalid

  Scenario: [WATER - <JIRA no.> - AC3] Enter password with no symbols
    When I enter a password with no symbols
    Then I see an error telling me the password is invalid

  Scenario: [WATER - <JIRA no.> - AC4] Enter non-matching passwords
    When I enter valid passwords which don't match
    Then I see an error telling me the passwords don't match

  Scenario: [WATER - <JIRA no.> - AC5] Sign in with existing password to show that it hasn't been changed
    Given I am on the sign in page
    When I sign into my account as "water_user1"
    Then I am on the internal abstraction licences page

  Scenario: [WATER - <JIRA no.> - AC6] Enter valid password
    When I enter a valid password
    Then I see the Password Changed screen

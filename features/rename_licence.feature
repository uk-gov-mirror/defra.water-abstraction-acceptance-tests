@readwrite @bs
Feature: [WATER - <JIRA no.>] Rename licence
  As a business with a water abstraction licence
  I want to be able to check my licence details
  So that I know how much water I am licenced to abstract legally

  Background:
    Given I sign into my account as "water_user1"
    And I select a particular licence
    When I select the link to name the licence

  Scenario: [WATER - <JIRA no.> - AC1] Reset licence name
    When I reset the licence name
    Then the expected licence name appears on the licence summary page

  Scenario: [WATER - <JIRA no.> - AC2] Cancel licence rename
    When I select the Cancel link
    Then the expected licence name appears on the licence summary page

  Scenario: [WATER - <JIRA no.> - AC3] Invalid licence rename
    When I enter a licence name which is invalid
    Then I see an error message telling me the name is invalid
    And the expected licence name appears on the licence summary page

  Scenario: [WATER - <JIRA no.> - AC4] Valid licence rename
    When I enter a valid licence name
    Then the expected licence name appears on the licence summary page
    And the licence name is searchable on the abstraction licences page
    And all licences containing that term are shown on screen

  Scenario: [WATER - <JIRA no.> - AC5] Reset licence name
    When I reset the licence name
    Then the expected licence name appears on the licence summary page

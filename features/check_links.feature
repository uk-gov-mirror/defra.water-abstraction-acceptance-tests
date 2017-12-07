@wip
Feature: Check links
  As a tester
  I want to check all of the links in the service
  So that I know that none of them have broken in the latest deployment

Background:
  Given I sign in with valid login details
  And I am on the abstraction licences page

Scenario: Check all links
  When I select "Licence number: 18/54/13/0381"
   And I check the licence contact details
  Then I am on the contact details page
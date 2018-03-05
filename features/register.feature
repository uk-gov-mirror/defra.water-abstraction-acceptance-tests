@readwrite
Feature: Register
  As a user with a water abstraction licence
  I want to register with the service
  So that I can view my licence

Scenario: Register a licence
  Given I am a new user
  When I register my email address on the service
  Then I receive an email with sign in details
  And I can sign in with my new email address
  And I am on the add licences page

  Given I am on the add licences page
  When I register a licence
  Then I receive a confirmation code
  And I can sign in with my new email address

  Given I am on the confirmation code page
  When I enter my confirmation code
  Then I am on the external abstraction licences page
  And I can select the licence I registered

  Given I am on the sign in page
  And I sign into my account as "water_user1"
  When I enter an email address on the licence holder's email field
  Then all licences containing that term are shown on screen

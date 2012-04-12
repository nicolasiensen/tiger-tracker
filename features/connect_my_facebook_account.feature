Feature: Connect my Facebook account
  In order to get started tracking my datings
  As a man
  I want to connect my Facebook account

  @omniauth_test
  Scenario: when it's my first time
    Given I am at the homepage
    When I click Connect with Facebook
    Then I should be on the homepage
    And I should see Welcome Nícolas! Who are we going out today?
    And I should not see Connect with Facebook

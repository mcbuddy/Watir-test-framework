# ../features/campaign.feature

Feature: As end user I want to search watir on google

  Scenario: Search watir on google
    Given I at google search homepage
    When I search for "watir" keyword
    Then I should see "watir" search result
    And I should see "watir" official homepage

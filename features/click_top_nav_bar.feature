# ../features/campaign.feature

Feature: As end user I want to click all the navigation bar

  Scenario Outline: Click all the navigation bar on the homepage
    Given I at inRhythm search homepage
    When I click <button> on the top navigation
    Then I should go to <button> section page

    Examples:
    |   button    |
    | About       |
    | Services    |
    | Portfolio   |
    | Contact     |

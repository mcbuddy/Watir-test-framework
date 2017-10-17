# ../features/click_all_button.feature

Feature: As end user I want to click all the buttons at the homepage

  Scenario Outline: Click all the buttons at the homepage
    Given I at inRhythm search homepage
    When I click <button> on the homepage
    Then I should go to <button> section page

    Examples:
    |      button     |
    | "Find Out More" |
    | "Get Started!"  |
# ../features/click_email_link.feature

Feature: As end user I want to click the email link

  Scenario: Click the email link at the homepage
    Given I at inRhythm search homepage
    When I click "feedback@inrhythm.com" on the homepage
    Then I should be able to send the email to "feedback@inrhythm.com"
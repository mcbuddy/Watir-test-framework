require_relative 'watir_helper'
require_relative '../pages/search_page'
include WatirHelper
include SearchPage

Before do |scenario|
  @browser = WatirHelper.browser
end

After do |scenario|
  @browser.quit
end

Given(/^I at google search homepage$/) do
  @browser.goto(ENV['URI'])
  expect(@browser.url).to include(ENV['URI'])
end

When(/^I search for "([^"]*)" keyword$/) do |keyword|
  SearchPage.search_bar(keyword)
end

Then(/^I should see "([^"]*)" search result$/) do |keyword|
  SearchPage.wait_for_result
end

Then(/^I should see "([^"]*)" official homepage$/) do |keyword|
  @browser.element(xpath: '//*[@id="rso"]/div/div[1]/div/h3/a').click
  expect(@browser.title.to eql('Watir.com | Web Application Testing in Ruby'))
end
